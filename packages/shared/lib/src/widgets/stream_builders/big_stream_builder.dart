import 'package:flutter/material.dart';

import '../base_loader.dart';
import '../errors/server_error_widget.dart';

class BigStreamBuilder<T> extends StatelessWidget {
  final Stream<T> stream;
  final Function(BuildContext context, AsyncSnapshot<T?> snapshot) onComplete;
  final Function()? onLoading;
  final Function(AsyncSnapshot<T?> snapshot)? onError;
  final T? initialData;

  const BigStreamBuilder({
    super.key,
    required this.stream,
    required this.onComplete,
    this.onLoading,
    this.onError,
    this.initialData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<T?>(
        stream: stream,
        initialData: initialData,
        builder: (context, AsyncSnapshot<T?> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Scaffold(
                appBar: AppBar(),
                body: onLoading == null ? const BaseLoader() : onLoading!(),
              );
            case ConnectionState.done:
            default:
              if (snapshot.hasData) {
                return onComplete(context, snapshot);
              } else {
                return Scaffold(
                  appBar: AppBar(),
                  body: onError == null ? const ServerErrorWidget() : onError!(snapshot),
                );
              }
          }
        },
      ),
    );
  }
}

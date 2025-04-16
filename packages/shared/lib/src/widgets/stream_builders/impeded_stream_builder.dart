import 'package:flutter/material.dart';

import '../base_loader.dart';
import '../errors/server_error_widget.dart';

class ImpededStreamBuilder<T> extends StatelessWidget {
  final Stream<T> stream;
  final Function(BuildContext context, AsyncSnapshot<T?> snapshot) onComplete;
  final Function()? onLoading;
  final Function(AsyncSnapshot<T?> snapshot)? onError;
  final T? initialData;

  const ImpededStreamBuilder({
    super.key,
    required this.stream,
    required this.onComplete,
    this.onLoading,
    this.onError,
    this.initialData,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T?>(
      stream: stream,
      initialData: initialData,
      builder: (context, AsyncSnapshot<T?> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            if (initialData != null) {
              return onComplete(context, snapshot);
            }
            return onLoading == null ? const BaseLoader() : onLoading!();
          case ConnectionState.done:
          default:
            if (snapshot.hasData) {
              return onComplete(context, snapshot);
            } else {
              debugPrint("StreamError::: ${snapshot.error}");
              return onError == null ? const ServerErrorWidget() : onError!(snapshot);
            }
        }
      },
    );
  }
}

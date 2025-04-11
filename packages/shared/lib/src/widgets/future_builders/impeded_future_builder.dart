import 'package:flutter/material.dart';

import '../base_loader.dart';
import '../errors/server_error_widget.dart';

class ImpededFutureBuilder<T> extends StatelessWidget {
  final Future<T> future;
  final Function(BuildContext context, AsyncSnapshot<T?> snapshot) onComplete;
  final Function()? onLoading;
  final Function(AsyncSnapshot<T?> snapshot)? onError;
  final T? initialData;

  const ImpededFutureBuilder({
    super.key,
    required this.future,
    required this.onComplete,
    this.onLoading,
    this.onError,
    this.initialData,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T?>(
      future: future,
      initialData: initialData,
      builder: (context, AsyncSnapshot<T?> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return onLoading == null ? BaseLoader() : onLoading!();
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

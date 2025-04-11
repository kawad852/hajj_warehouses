import 'package:flutter/material.dart';

import '../../network/api_service.dart';
import '../base_loader.dart';
import '../errors/app_error_widget.dart';

class BigFutureBuilder<T> extends StatefulWidget {
  final Future<T> future;
  final Function(BuildContext context, AsyncSnapshot<T?> snapshot) onComplete;
  final Function()? onLoading;
  final Function(AsyncSnapshot<T?> snapshot)? onError;
  final T? initialData;

  const BigFutureBuilder({
    super.key,
    required this.future,
    required this.onComplete,
    this.onLoading,
    this.onError,
    this.initialData,
  });

  @override
  State<BigFutureBuilder<T>> createState() => _BigFutureBuilderState<T>();
}

class _BigFutureBuilderState<T> extends State<BigFutureBuilder<T>> {
  late Future<T> _future;

  void _initialize() {
    _future = ApiService.build(
      callBack: () async {
        return widget.future;
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<T?>(
        future: _future,
        initialData: widget.initialData,
        builder: (context, AsyncSnapshot<T?> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Scaffold(
                appBar: AppBar(),
                body: widget.onLoading == null ? BaseLoader() : widget.onLoading!(),
              );
            case ConnectionState.done:
            default:
              if (snapshot.hasData) {
                return widget.onComplete(context, snapshot);
              } else {
                return Scaffold(
                  appBar: AppBar(),
                  body:
                      widget.onError == null
                          ? AppErrorWidget(
                            error: snapshot.error,
                            onRetry: () {
                              setState(() {
                                _initialize();
                              });
                            },
                          )
                          : widget.onError!(snapshot),
                );
              }
          }
        },
      ),
    );
  }
}

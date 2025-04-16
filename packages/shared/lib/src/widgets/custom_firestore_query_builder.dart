import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';

import 'base_loader.dart';
import 'errors/server_error_widget.dart';

class CustomFirestoreQueryBuilder<T> extends StatelessWidget {
  final Query<T> query;
  final Function(BuildContext context, FirestoreQueryBuilderSnapshot<T> snapshot) onComplete;
  final Future Function(List<QueryDocumentSnapshot<T>> docs)? secondaryQueryBuilder;
  final Function()? onLoading;

  const CustomFirestoreQueryBuilder({
    super.key,
    required this.query,
    required this.onComplete,
    this.onLoading,
    this.secondaryQueryBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return FirestoreQueryBuilder<T>(
      query: query,
      pageSize: 10,
      // secondaryQueryBuilder: secondaryQueryBuilder,
      builder: (context, snapshot, _) {
        if (snapshot.hasData) {
          return onComplete(context, snapshot);
        } else if (snapshot.isFetching) {
          return onLoading == null ? const BaseLoader() : onLoading!();
        } else {
          debugPrint("snapshotError::: ${snapshot.error}");
          return const ServerErrorWidget();
        }
      },
    );
  }
}

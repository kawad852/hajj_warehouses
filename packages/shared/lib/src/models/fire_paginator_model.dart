import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirePaginatorModel<T> {
  List<QueryDocumentSnapshot<T>> docs;
  bool isFetchingMore;
  bool hasMore;
  Function() fetchMore;
  Function() fetch;
  Widget? Function() toggleLoader;

  FirePaginatorModel({
    required this.docs,
    required this.isFetchingMore,
    required this.hasMore,
    required this.fetchMore,
    required this.fetch,
    required this.toggleLoader,
  });
}

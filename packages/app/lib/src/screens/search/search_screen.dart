import 'package:app/screens_exports.dart';
import 'package:app/src/screens/search/widgets/anchor_tile.dart';
import 'package:shared/algolia_exports.dart';
import 'package:shared/shared.dart';

class SearchScreen<T> extends StatefulWidget {
  final String indexName;
  final bool isFullScreen;
  final String? hintText;
  final Widget Function(MySearchController controller)? builder;
  final Function(ItemModel e)? onTap;
  final String? categoryId;

  const SearchScreen({
    super.key,
    required this.indexName,
    this.builder,
    this.isFullScreen = true,
    this.onTap,
    this.hintText,
    this.categoryId,
  });

  @override
  State<SearchScreen<T>> createState() => _SearchScreenState<T>();
}

class _SearchScreenState<T> extends State<SearchScreen<T>> {
  Future<List<dynamic>> _searchFuture = Future.value([]);

  void _initialize(String value) {
    if (value.isEmpty) {
      _searchFuture = Future.value([]);
      return;
    }
    _searchFuture = _fetch(value);
  }

  Future<List<dynamic>> _fetch(String query) async {
    try {
      if (query == '') {
        return [];
      }
      final productsFuture = kAlgoliaClient
          .searchIndex(
            request: SearchForHits(
              indexName: widget.indexName,
              query: query,
              hitsPerPage: 10,
              filters: widget.categoryId != null ? 'categoryId:${widget.categoryId}' : null,
            ),
          )
          .then((value) {
            return value.hits.map((e) => ItemModel.fromJson(e.toJson())).toList();
          });
      // final foodStoresFuture = kAlgoliaClient
      //     .searchIndex(
      //   request: SearchForHits(
      //     indexName: AlgoliaIndices.foodStores.value,
      //     query: query,
      //     hitsPerPage: 10,
      //   ),
      // )
      //     .then((value) {
      //   return value.hits.map((e) => StoreModel.fromJson(e.toJson())).toList();
      // });
      return Future.wait([productsFuture]);
    } catch (e) {
      debugPrint("SearchError::: $e");
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return FireAnimatedSearchBar(
      hintText: widget.hintText ?? "ابحث عن صنف",
      isFullScreen: widget.isFullScreen,
      onChanged: (value) {
        setState(() {
          _initialize(value);
        });
      },
      builder: (context, controller) {
        return widget.builder != null
            ? widget.builder!(controller)
            : BaseEditor(
              required: false,
              hintText: "ابحث عن صنف",
              hintStyle: TextStyle(
                color: context.colorPalette.grey666,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              prefixIcon: const IconButton(onPressed: null, icon: CustomSvg(MyIcons.search)),
              readOnly: true,
              onTap: () {
                controller.openView();
              },
            );
      },
      resultsBuilder: (context, query) {
        if (query.isEmpty) {
          return const SizedBox.shrink();
        }
        return ImpededFutureBuilder(
          key: ValueKey(query),
          future: _searchFuture,
          onComplete: (context, snapshot) {
            final products = snapshot.data![0] as List<ItemModel>;
            if (products.isEmpty) {
              return const SizedBox.shrink();
            }
            return SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: kScreenMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                    products.map((element) {
                      return AnchorTile(
                        name: element.name,
                        onTap: () {
                          if (widget.onTap != null) {
                            widget.onTap!(element);
                            return;
                          } else {
                            context.push((context) {
                              return ItemManagementScreen(item: element);
                            });
                          }
                        },
                      );
                    }).toList(),
              ),
            );
          },
        );
      },
    );
  }
}

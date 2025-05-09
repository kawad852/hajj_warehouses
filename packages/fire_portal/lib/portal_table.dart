import 'package:fire_portal/table_source.dart';
import 'package:shared/shared.dart';

class PortalTable<T> extends StatelessWidget {
  final String tableTitle;
  final double? dataRowMaxHeight;
  final Widget? header;
  final List<Widget>? appbarActions;
  final List<Widget>? tableActions;
  final Query<T> query;
  final PreferredSizeWidget? bottom;
  final List<PortalContent> Function(int index, FirestoreQueryBuilderSnapshot<T> snapshot)
  tableBuilder;
  final List<Widget> Function(T snapshot) inputBuilder;
  final Function(T snapshot) onSave;

  const PortalTable({
    super.key,
    required this.tableTitle,
    this.dataRowMaxHeight,
    this.header,
    this.appbarActions,
    this.tableActions,
    required this.query,
    this.bottom,
    required this.tableBuilder,
    required this.inputBuilder,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // if (context.mediaQuery.width < kMaxSmallDeviceWidth)
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 10),
              child: IconButton(
                onPressed: () async {
                  // try {
                  //   final a = await kFirebaseInstant.branches.get().then((value) {
                  //     print("length:: ${value.docs.length}");
                  //   });
                  // } catch (e) {
                  //   print("e:: $e");
                  // }
                  // scaffoldKey.currentState!.openDrawer();
                },
                icon: const Icon(FontAwesomeIcons.bars),
              ),
            ),
            Text(tableTitle),
          ],
        ),
        actions: [if (appbarActions != null) ...appbarActions!, const SizedBox(width: 10)],
        bottom: bottom,
      ),
      body: CustomFirestoreQueryBuilder<T>(
        query: query,
        onLoading:
            () => SizedBox(height: context.mediaQuery.height / 1.5, child: const BaseLoader()),
        onComplete: (context, snapshot) {
          final columns = tableBuilder(0, snapshot).map((e) => e.column).toList();
          return SingleChildScrollView(
            child: Theme(
              data: Theme.of(
                context,
              ).copyWith(cardTheme: const CardThemeData(margin: EdgeInsets.all(20))),
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: context.mediaQuery.width,
                      child: PaginatedDataTable(
                        dataRowMaxHeight: dataRowMaxHeight,
                        header: header,
                        actions: header != null ? tableActions : null,
                        columns: List.generate(columns.length + 1, (index) {
                          if (index == columns.length) {
                            return DataColumn(label: SizedBox.shrink());
                          }
                          final dataColumn = columns[index];
                          return dataColumn;
                        }),
                        // columns:
                        //     tableBuilder(0, snapshot).map((e) => e.column).map((e) {
                        //       return e;
                        //     }).toList(),
                        source: TableSource(
                          length: snapshot.docs.length,
                          rows: (index) {
                            if (snapshot.hasMore && index + 1 == snapshot.docs.length) {
                              snapshot.fetchMore();
                            }
                            final cells = tableBuilder(index, snapshot).map((e) => e.cell).toList();
                            return DataRow.byIndex(
                              index: index,
                              cells: List.generate(cells.length + 1, (index) {
                                if (index == cells.length) {
                                  return DataCell(
                                    TableMenu(
                                      onEdit: () {
                                        context.navigate((context) {
                                          return PortalInput(
                                            q: snapshot.docs[index].data(),
                                            onSave: onSave,
                                            inputBuilder: inputBuilder,
                                          );
                                        });
                                      },
                                      onDelete: null,
                                    ),
                                  );
                                }
                                final cell = cells[index];
                                return cell;
                              }),
                            );
                          },
                        ),
                      ),
                    ),
                    if (snapshot.isFetching || snapshot.isFetchingMore)
                      Positioned.fill(
                        child: Container(
                          margin: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: context.colorScheme.inverseSurface.withOpacity(0.10),
                            borderRadius: BorderRadius.circular(MyTheme.radiusTertiary),
                          ),
                          child: BaseLoader(),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

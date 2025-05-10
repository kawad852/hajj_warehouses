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
  final List<DataCell> Function(int index, FirestoreQueryBuilderSnapshot<T> snapshot) cellsBuilder;
  final List<DataColumn> columns;
  final List<Widget> Function(T snapshot) inputBuilder;
  final Future<void> Function(DocumentReference<T>? ref, T snapshot) onSave;
  final T data;
  final DocumentReference<T> reference;
  final Function(Map<String, dynamic> value)? convertor;

  const PortalTable({
    super.key,
    required this.tableTitle,
    this.dataRowMaxHeight,
    this.header,
    this.appbarActions,
    this.tableActions,
    required this.query,
    this.bottom,
    required this.cellsBuilder,
    required this.inputBuilder,
    required this.onSave,
    required this.columns,
    required this.data,
    this.convertor,
    required this.reference,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (context.mediaQuery.width < kMaxSmallDeviceWidth)
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 10),
                child: IconButton(
                  onPressed: () async {
                    Scaffold.of(context).openDrawer();
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
                        header:
                            header.toString() != SizedBox.shrink().toString()
                                ? Align(
                                  alignment: AlignmentDirectional.centerStart,
                                  child:
                                      header ??
                                      IconButton.filled(
                                        onPressed: () {
                                          context.navigate((context) {
                                            return PortalInput<T>(
                                              onSave: onSave,
                                              inputBuilder: inputBuilder,
                                              data: data,
                                              reference: reference,
                                            );
                                          });
                                        },
                                        icon: Icon(Icons.add),
                                      ),
                                )
                                : null,
                        actions: header != null ? tableActions : null,
                        columns: List.generate(columns.length + 1, (index) {
                          if (index == columns.length) {
                            return DataColumn(label: SizedBox.shrink());
                          }
                          final dataColumn = columns[index];
                          return dataColumn;
                        }),
                        source: TableSource(
                          length: snapshot.docs.length,
                          rows: (index) {
                            if (snapshot.hasMore && index + 1 == snapshot.docs.length) {
                              snapshot.fetchMore();
                            }

                            final cells = cellsBuilder(index, snapshot).toList();
                            final queryDocSnapshot = snapshot.docs[index];

                            return DataRow.byIndex(
                              index: index,
                              cells: List.generate(cells.length + 1, (index) {
                                if (index == cells.length) {
                                  return DataCell(
                                    TableMenu(
                                      onEdit: () {
                                        context.navigate((context) {
                                          return PortalInput(
                                            onSave: onSave,
                                            inputBuilder: inputBuilder,
                                            data: queryDocSnapshot.data(),
                                            reference: queryDocSnapshot.reference,
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
                            color: context.colorScheme.inverseSurface.withValues(alpha: 0.10),
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

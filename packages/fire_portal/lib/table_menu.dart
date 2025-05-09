import 'package:shared/shared.dart';

class TableMenu extends StatelessWidget {
  final Function()? onEdit;
  final Function()? onDelete;

  const TableMenu({super.key, required this.onEdit, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    final portalProvider = context.portalProvider;
    if (onEdit == null && onDelete == null) {
      return const SizedBox.shrink();
    }
    return Center(
      child: PopupMenuButton<TableMenuOption>(
        tooltip: '',
        onSelected: (TableMenuOption item) {
          if (item == TableMenuOption.edit) {
            onEdit!();
          } else if (item == TableMenuOption.delete) {
            onDelete!();
          }
        },
        icon: const Icon(Icons.more_vert),
        itemBuilder:
            (BuildContext context) => [
              if (onEdit != null &&
                  portalProvider.hasTablePermission(context, TableMenuOption.edit))
                PopupMenuItem<TableMenuOption>(
                  value: TableMenuOption.edit,
                  child: Text(context.appLocalization.edit),
                ),
              if (onDelete != null &&
                  portalProvider.hasTablePermission(context, TableMenuOption.delete))
                PopupMenuItem<TableMenuOption>(
                  value: TableMenuOption.delete,
                  child: Text(context.appLocalization.delete),
                ),
            ],
      ),
    );
  }
}

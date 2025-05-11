import 'package:intl/intl.dart' as intl;
import 'package:shared/shared.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  late Query<NotificationModel> _notificationsQuery;

  void _initializeQuery() {
    _notificationsQuery = kFirebaseInstant.notifications(MySharedPreferences.user!.id!).orderByDesc;
  }

  @override
  void initState() {
    super.initState();
    context.userProvider.userDocRef.update({MyFields.unReadNotificationsCount: 0});
    _initializeQuery();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.appLocalization.notifications)),
      body: CustomFirestoreQueryBuilder(
        query: _notificationsQuery,
        onComplete: (context, snapshot) {
          if (snapshot.docs.isEmpty) {
            return EmptyWidget(
              icon: FontAwesomeIcons.bell,
              title: context.appLocalization.emptyNotificationsTitle,
              body: context.appLocalization.emptyNotificationsBody,
            );
          }

          return ListView.separated(
            itemCount: snapshot.docs.length,
            separatorBuilder: (context, index) => const Divider(height: 0),
            padding: const EdgeInsets.symmetric(vertical: kScreenMargin),
            itemBuilder: (context, index) {
              if (snapshot.hasMore && index + 1 == snapshot.docs.length) {
                snapshot.fetchMore();
              }

              final notification = snapshot.docs[index].data();
              final id = notification.data?.id;
              final type = notification.data?.type;
              return ListTile(
                onTap:
                    id != null
                        ? () {
                          print("type:: $type");
                          NotificationRouteHandler.toggle(context, id: id, type: type);
                        }
                        : null,
                title: Text(notification.notification!.title!, style: context.textTheme.bodyLarge),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(notification.notification!.body!, style: const TextStyle(fontSize: 12)),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        intl.DateFormat.yMd(
                          context.languageCode,
                        ).add_jm().format(notification.createdAt!),
                        style: const TextStyle(fontSize: 10),
                        textDirection: TextDirection.ltr,
                      ),
                    ),
                  ],
                ),
                trailing: id != null ? const Icon(Icons.arrow_forward_ios, size: 13) : null,
              );
            },
          );
        },
      ),
    );
  }
}

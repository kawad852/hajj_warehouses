import 'package:app/shared.dart';
import 'package:app/src/screens/user/widgets/user_card.dart';
import 'package:shared/shared.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  late Query<UserModel> _usersQuery;

  void _initialize() {
    _usersQuery = kFirebaseInstant.users.whereIdBranch.orderByDesc;
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: AppBarText(context.appLocalization.humanResources)),
      bottomNavigationBar: BottomButton(
        text: context.appLocalization.add,
        onPressed: () {
          context.navigate((context) => const UserInputScreen());
        },
      ),
      body: CustomFirestoreQueryBuilder(
        query: _usersQuery,
        onComplete: (context, snapshot) {
          final users = snapshot.docs;
          return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: users.length,
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            itemBuilder: (context, index) {
              if (snapshot.isLoadingMore(index)) {
                return const FPLoading();
              }
              final user = users[index].data();
              return UserCard(user: user);
            },
          );
        },
      ),
    );
  }
}

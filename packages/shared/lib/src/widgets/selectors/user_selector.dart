import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/user/user_model.dart';

class UserSelector extends StatelessWidget {
  final Widget Function(BuildContext, UserModel) builder;

  const UserSelector({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return Selector<UserModel, UserModel>(
      selector: (context, provider) => provider,
      builder: (context, user, _) {
        return builder(context, user);
      },
    );
  }
}

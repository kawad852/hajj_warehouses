import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class AnchorTile extends StatelessWidget {
  final VoidCallback onTap;
  final String? thumbnail, name, description;

  const AnchorTile({
    super.key,
    required this.onTap,
    this.thumbnail,
    required this.name,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading:
          thumbnail != null
              ? BaseNetworkImage(thumbnail!, height: 45, width: 45, radius: kRadiusPrimary)
              : null,
      title: Text(name!),
      subtitle:
          description != null
              ? Text(description!, maxLines: 1, overflow: TextOverflow.ellipsis)
              : null,
      trailing: const Icon(Icons.arrow_forward_ios, size: 13),
    );
  }
}

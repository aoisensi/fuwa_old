// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:fuwa/entity/discord/user.dart';

class UserAvatarView extends StatelessWidget {
  const UserAvatarView({required this.user, super.key});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Image.network(user.avatarUrl);
  }
}

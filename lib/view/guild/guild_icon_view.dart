// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:fuwa/entity/discord/guild.dart';

class GuildIconView extends StatelessWidget {
  const GuildIconView({required this.guild, super.key});

  final Guild guild;

  @override
  Widget build(BuildContext context) {
    final iconUrl = guild.iconUrl;
    if (iconUrl != null) return Image.network(iconUrl);
    return Container(
      color: Theme.of(context).cardColor,
      child: Center(
        child: Text(guild.name[0]),
      ),
    );
  }
}

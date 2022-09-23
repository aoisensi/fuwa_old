// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:fuwa/entity/discord/guild.dart';
import 'package:fuwa/entity/discord/id.dart';
import 'package:fuwa/pod/pod_key.dart';
import 'package:fuwa/state/account_state.dart';

class GuildPod {
  GuildPod._();
  static final providers = Provider.family<Guild, GuildId>(
    (ref, arg) => ref.watch(
      _provider(PodKey(ref.watch(AccountState.currentIdProvider), arg)),
    ),
    dependencies: [
      AccountState.currentIdProvider,
      GuildPod._provider,
    ],
  );

  static final _provider =
      StateProvider.family<Guild, PodKey<GuildId>>((ref, arg) => Guild.dummy);

  static GuildId store(Reader read, UserId accountId, dynamic json) {
    final guild = Guild.fromJson(json);
    final key = PodKey(accountId, guild.id);
    read(_provider(key).state).state = guild;
    return guild.id;
  }

  static List<GuildId> storeAll(Reader read, UserId accountId, dynamic json) =>
      (json as List<dynamic>)
          .map((json) => store(read, accountId, json))
          .toList();
}

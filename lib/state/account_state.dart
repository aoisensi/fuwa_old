// Package imports:

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:fuwa/entity/discord/id.dart';
import 'package:fuwa/service/discord/discord_service.dart';

class AccountState extends StateNotifier<List<DiscordService>> {
  AccountState() : super([]);

  static final accountsProvider =
      StateNotifierProvider<AccountState, List<DiscordService>>(
    (ref) => AccountState(),
  );

  static final currentIdProvider =
      Provider<UserId>((ref) => throw UnimplementedError());

  void add(DiscordService service) {
    state = [...state, service];
  }

  void replace(List<DiscordService> services) {
    state = services;
  }
}

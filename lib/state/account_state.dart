// Package imports:

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:fuwa/entity/discord/id.dart';
import 'package:fuwa/service/discord/discord_service.dart';
import 'package:fuwa/state/config_state.dart';

class AccountState extends StateNotifier<List<DiscordService>> {
  AccountState() : super([]);

  static final accountsProvider =
      StateNotifierProvider<AccountState, List<DiscordService>>(
    (ref) => AccountState(),
  );

  static final currentIdProvider =
      StateProvider<UserId>((ref) => ref.read(ConfigState.selectedAccountId));

  static final currentServiceProvider = Provider((ref) {
    final id = ref.watch(currentIdProvider);
    final services = ref.read(accountsProvider);
    return services.firstWhere((service) => service.currentUserId == id);
  });

  void add(DiscordService service) {
    state = [...state, service];
  }

  void replace(List<DiscordService> services) {
    state = services;
  }
}

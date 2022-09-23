// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:fuwa/entity/discord/id.dart';
import 'package:fuwa/entity/discord/user.dart';
import 'package:fuwa/pod/pod_label.dart';
import 'package:fuwa/state/account_state.dart';

class UserPod {
  UserPod._();
  static final providers = Provider.family<User, UserId>(
    (ref, arg) => ref.watch(
      _provider(
        PodLabel(ref.watch(AccountState.currentIdProvider), arg),
      ),
    ),
    dependencies: [
      AccountState.currentIdProvider,
      UserPod._provider,
    ],
  );
  static final currentProvider = Provider<User>(
    (ref) {
      final id = ref.watch(AccountState.currentIdProvider);
      return ref.watch(_provider(PodLabel(id, id)));
    },
    dependencies: [
      AccountState.currentIdProvider,
      UserPod._provider,
    ],
  );

  static final _provider =
      StateProvider.family<User, PodLabel<UserId>>((ref, arg) => User.dummy);

  static UserId store(Reader read, dynamic json, {bool isCurrentUser = false}) {
    final user = User.fromJson(json);
    final accountId =
        isCurrentUser ? user.id : read(AccountState.currentIdProvider);
    final label = PodLabel(accountId, user.id);
    read(_provider(label).state).state = user;
    return user.id;
  }
}

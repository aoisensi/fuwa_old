// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:fuwa/entity/discord/id.dart';
import 'package:fuwa/entity/discord/user.dart';
import 'package:fuwa/pod/pod_key.dart';
import 'package:fuwa/state/account_state.dart';

class UserPod {
  UserPod._();
  static final providers = Provider.family<User, UserId>(
    (ref, arg) => ref.watch(
      _provider(
        PodKey(ref.watch(AccountState.currentIdProvider), arg),
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
      return ref.watch(_provider(PodKey(id, id)));
    },
    dependencies: [
      AccountState.currentIdProvider,
      UserPod._provider,
    ],
  );

  static final _provider =
      StateProvider.family<User, PodKey<UserId>>((ref, arg) => User.dummy);

  static UserId store(Reader read, UserId? accountId, dynamic json) {
    final user = User.fromJson(json);
    accountId ??= user.id;
    final key = PodKey(accountId, user.id);
    read(_provider(key).state).state = user;
    return user.id;
  }
}

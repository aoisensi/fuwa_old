// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:fuwa/pod/user_pod.dart';
import 'package:fuwa/state/account_state.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final services = ref.watch(AccountState.accountsProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Fuwa')),
      body: ListView.builder(
        itemCount: services.length,
        itemBuilder: ((context, index) {
          final service = services[index];
          return ProviderScope(
            overrides: [
              AccountState.currentIdProvider
                  .overrideWithValue(service.currentUserId),
            ],
            child: Consumer(
              builder: (context, ref, child) {
                final user = ref.watch(UserPod.currentProvider);
                return ListTile(
                  title: Text(user.username),
                  trailing: CircleAvatar(
                    backgroundImage: NetworkImage(user.avatarUrl),
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}

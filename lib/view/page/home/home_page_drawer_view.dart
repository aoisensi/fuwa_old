// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:fuwa/pod/guild_pod.dart';
import 'package:fuwa/pod/user_pod.dart';
import 'package:fuwa/state/account_state.dart';
import 'package:fuwa/view/guild/guild_icon_view.dart';
import 'package:fuwa/view/user/user_avatar_view.dart';

class HomePageDrawerView extends ConsumerWidget {
  const HomePageDrawerView({super.key});

  static const _serverIconSize = 48.0;
  static const _serverWidth = 72.0;
  static const _channelWidth = 240.0;
  static const _width = _serverWidth + _channelWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final services = ref.watch(AccountState.accountsProvider);
    final service = ref.watch(AccountState.currentServiceProvider);
    return SizedBox(
      width: _width,
      child: Drawer(
        child: Row(
          children: [
            SizedBox(
              width: _serverWidth,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                      itemCount: services.length,
                      itemBuilder: (context, index) {
                        final service = services[index];
                        return ProviderScope(
                          overrides: [
                            AccountState.currentIdProvider.overrideWithValue(
                                StateController(service.currentUserId)),
                          ],
                          child: Consumer(
                            builder: (context, ref, child) {
                              final user = ref.watch(UserPod.currentProvider);
                              return _ServerButtonView(
                                child: UserAvatarView(user: user),
                              );
                            },
                          ),
                        );
                      },
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                    ),
                    const Divider(),
                    ListView.builder(
                      itemCount: service.currentGuildIds.length,
                      itemBuilder: (context, index) {
                        final guildId = service.currentGuildIds[index];
                        final guild = ref.watch(GuildPod.providers(guildId));
                        return _ServerButtonView(
                          child: GuildIconView(guild: guild),
                        );
                      },
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ServerButtonView extends StatelessWidget {
  // ignore: unused_element
  const _ServerButtonView({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: HomePageDrawerView._serverWidth,
      child: Center(
        child: Container(
          height: HomePageDrawerView._serverIconSize,
          width: HomePageDrawerView._serverIconSize,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: child,
        ),
      ),
    );
  }
}

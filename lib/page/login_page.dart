// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:fuwa/page/home_page.dart';
import 'package:fuwa/service/discord/discord_service.dart';
import 'package:fuwa/state/account_state.dart';
import 'package:fuwa/state/config_state.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fuwa Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _onLogin(context, ref),
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }

  void Function() _onLogin(BuildContext context, WidgetRef ref) => () async {
        final navigator = Navigator.of(context);
        final config = ref.read(ConfigState.service);
        final token = await DiscordService.getOAuth2Token();
        final service =
            DiscordService.fromTokenResponse(token, config.replaceToken);
        await service.initalize(ref.read);
        ref.read(AccountState.accountsProvider.notifier).add(service);
        await config.addToken(token.refreshToken!);
        await config.setSelectedAccount(service.currentUserId);
        await navigator.pushReplacement(MaterialPageRoute(
          builder: (context) => const HomePage(),
        ));
      };
}

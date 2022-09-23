// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:fuwa/page/home_page.dart';
import 'package:fuwa/page/login_page.dart';
import 'package:fuwa/service/discord/discord_service.dart';
import 'package:fuwa/state/account_state.dart';
import 'package:fuwa/state/config_state.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _loading(context, ref);
    return const Center(
      child: Text('Welcome to Fuwa'),
    );
  }

  Future<void> _loading(BuildContext context, WidgetRef ref) async {
    final navigator = Navigator.of(context);
    await Future.delayed(const Duration(seconds: 1));
    final tokens = ref.watch(ConfigState.tokens);
    if (tokens.isEmpty) {
      await navigator.pushReplacement(MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ));
      return;
    }
    final config = ref.read(ConfigState.service);
    final services = tokens
        .map((token) =>
            DiscordService.fromRefreshToken(token, config.replaceToken))
        .toList();
    await Future.wait(services.map(
      (service) => service.initalize(ref.read),
    ));
    ref.watch(AccountState.accountsProvider.notifier).replace(services);
    await navigator.pushReplacement(MaterialPageRoute(
      builder: (context) => const HomePage(),
    ));
  }
}

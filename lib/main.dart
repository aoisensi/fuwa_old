// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:fuwa/app.dart';
import 'package:fuwa/service/config_service.dart';
import 'package:fuwa/state/config_state.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final config = ConfigService();

  await Future.wait([
    config.initialize(),
  ]);

  runApp(
    ProviderScope(
      overrides: [
        ConfigState.service.overrideWithValue(config),
      ],
      child: const App(),
    ),
  );
}

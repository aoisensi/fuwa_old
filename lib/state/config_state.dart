// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:fuwa/entity/discord/id.dart';
import '../service/config_service.dart';

class ConfigState {
  ConfigState._();
  static final service = Provider<ConfigService>(
    (ref) => throw UnimplementedError(),
  );

  static final tokens = Provider<List<String>>(
    (ref) => ref.watch(service).tokens,
  );

  static final selectedAccountId = Provider<UserId>(
    (ref) => ref.watch(service).selectedAccount,
  );
}

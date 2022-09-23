// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../service/config_service.dart';

class ConfigState {
  static final service = Provider<ConfigService>(
    (ref) => throw UnimplementedError(),
  );

  static final tokens = Provider<List<String>>(
    (ref) => ref.watch(service).tokens,
  );
}

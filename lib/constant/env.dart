// lib/env/env.dart

// Package imports:
import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied()
abstract class Env {
  @EnviedField(varName: 'CLIENT_ID')
  static const clientId = _Env.clientId;
  @EnviedField(varName: 'CLIENT_SECRET')
  static const clientSecret = _Env.clientSecret;
}

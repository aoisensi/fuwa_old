// Package imports:
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oauth2_client/access_token_response.dart';
import 'package:oauth2_client/oauth2_client.dart';

// Project imports:
import 'package:fuwa/constant/env.dart';
import 'package:fuwa/entity/discord/id.dart';
import 'package:fuwa/pod/user_pod.dart';

part 'discord_resource_user.dart';

typedef OnRefresh = Future<bool> Function(
    String oldRefreshToken, String newRefreshToken);

class DiscordService {
  DiscordService({
    required String refreshToken,
    String? accessToken,
    DateTime? expirationDate,
    OnRefresh? onRefresh,
  })  : _refreshToken = refreshToken,
        _accessToken = accessToken,
        _expiredDate = expirationDate ?? DateTime(0),
        _onRefresh = onRefresh;

  factory DiscordService.fromTokenResponse(
    AccessTokenResponse resp,
    OnRefresh? onRefresh,
  ) =>
      DiscordService(
        refreshToken: resp.refreshToken!,
        accessToken: resp.accessToken,
        expirationDate: resp.expirationDate,
        onRefresh: onRefresh,
      );

  factory DiscordService.fromRefreshToken(
          String refreshToken, OnRefresh? onRefresh) =>
      DiscordService(refreshToken: refreshToken, onRefresh: onRefresh);

  final OnRefresh? _onRefresh;

  String _refreshToken;
  String? _accessToken;
  DateTime _expiredDate;

  late final UserId currentUserId;

  Future<void> initalize(Reader read) async {
    await _checkRefresh();
    await Future.wait([
      resourceUser(read).getCurrentUser(),
    ]);
  }

  DiscordResourceUser resourceUser(Reader read) =>
      DiscordResourceUser(this, read);

  // Constant
  static final _scopes = ['identify', 'guilds'];

  static final _oauth2Client = OAuth2Client(
    authorizeUrl: 'https://discord.com/oauth2/authorize',
    tokenUrl: 'https://discord.com/api/oauth2/token',
    redirectUri: 'http://localhost:32817',
    customUriScheme: 'http://localhost:32817',
  );

  // Static Methods
  static Future<AccessTokenResponse> getOAuth2Token() {
    return _oauth2Client.getTokenWithAuthCodeFlow(
      clientId: Env.clientId,
      clientSecret: Env.clientSecret,
      scopes: _scopes,
    );
  }

  Future<void> _checkRefresh() async {
    if (_refreshNeeded) await _refreshOAuth2Token();
  }

  Future<void> _refreshOAuth2Token() async {
    final oldRefreshToken = _refreshToken;
    final resp = await _oauth2Client.refreshToken(
      _refreshToken,
      clientId: Env.clientId,
      clientSecret: Env.clientSecret,
    );
    _refreshToken = resp.refreshToken!;
    _accessToken = resp.accessToken!;
    _expiredDate = resp.expirationDate!;
    await _onRefresh?.call(oldRefreshToken, _refreshToken);
  }

  bool get _refreshNeeded =>
      _expiredDate.difference(DateTime.now()).inSeconds < 30 ||
      _accessToken == null;
}

abstract class _DiscordResourceBase {
  _DiscordResourceBase(DiscordService service, Reader read)
      : _service = service,
        _read = read;
  final DiscordService _service;
  final Reader _read;

  static const _version = 10;
  static const _baseUrl = 'https://discord.com/api/v$_version';
  static final _dio = Dio(BaseOptions(
    baseUrl: _baseUrl,
    validateStatus: ((status) => true),
  ));
  get _headers => {'Authorization': 'Bearer ${_service._accessToken}'};

  static _url(String path) => _baseUrl + path;

  Future<dynamic> _get({required String path}) async {
    await _service._checkRefresh();
    final resp = await _dio.get(
      _url(path),
      options: Options(headers: _headers),
    );
    return await _parse(resp);
  }

  Future<dynamic> _parse(Response<dynamic> resp) async {
    final code = resp.statusCode!;
    if (200 > code || code >= 300) {
      throw Exception();
    }
    return resp.data;
  }
}

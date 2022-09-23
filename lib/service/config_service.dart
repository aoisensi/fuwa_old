// Package imports:
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import 'package:fuwa/entity/discord/id.dart';

class ConfigService {
  late final SharedPreferences _prefs;

  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<bool> addToken(String token) {
    final tokens = this.tokens;
    tokens.add(token);
    return _prefs.setStringList('tokens', tokens);
  }

  Future<bool> removeToken(String token) {
    final tokens = this.tokens.where((t) => t != token).toList();
    return _prefs.setStringList('tokens', tokens);
  }

  List<String> get tokens => _prefs.getStringList('tokens') ?? [];

  Future<bool> replaceToken(String oldToken, String newToken) {
    final tokens = this
        .tokens
        .map((token) => token == oldToken ? newToken : token)
        .toList();
    return _prefs.setStringList('tokens', tokens);
  }

  UserId get selectedAccount => UserId(_prefs.getString('selected_account')!);

  Future<bool> setSelectedAccount(UserId id) {
    return _prefs.setString('selected_account', id.id);
  }

  SharedPreferences get prefs => _prefs;
}

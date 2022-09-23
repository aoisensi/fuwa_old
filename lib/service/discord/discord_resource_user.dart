part of 'discord_service.dart';

class DiscordResourceUser extends _DiscordResourceBase {
  DiscordResourceUser(super.service, super.read);

  Future<UserId> getUser(Reader read, UserId id) => _getUser(id.id);
  Future<UserId> getCurrentUser() => _getUser('@me');

  Future<UserId> _getUser(String ident) async {
    final json = await _get(path: '/users/$ident');
    final isCurrentUser = ident == '@me';
    final id = UserPod.store(_read, json, isCurrentUser: isCurrentUser);
    if (isCurrentUser) {
      _service.currentUserId = id;
    }
    return id;
  }
}

part of 'discord_service.dart';

class DiscordResourceUser extends _DiscordResourceBase {
  DiscordResourceUser(super.service, super.read);

  Future<UserId> getUser(Reader read, UserId id) => _getUser(id.id);
  Future<UserId> getCurrentUser() => _getUser('@me');

  Future<UserId> _getUser(String ident) async {
    final json = await _get(path: '/users/$ident');
    final isCurrentUser = ident == '@me';
    final accountId = isCurrentUser ? null : _service.currentUserId;
    final id = UserPod.store(_read, accountId, json);
    if (isCurrentUser) {
      _service.currentUserId = id;
    }
    return id;
  }

  Future<List<GuildId>> getCurrentUserGuilds() async {
    final json = await _get(path: '/users/@me/guilds');
    final ids = GuildPod.storeAll(_read, _service.currentUserId, json);
    _service._currentGuildIds = ids;
    return ids;
  }
}

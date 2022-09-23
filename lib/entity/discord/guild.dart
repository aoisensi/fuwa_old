// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:fuwa/constant/url.dart';
import 'package:fuwa/entity/discord/id.dart';

part 'guild.freezed.dart';
part 'guild.g.dart';

@freezed
class Guild with _$Guild {
  const Guild._();

  const factory Guild({
    required GuildId id,
    required String name,
    required String icon,
    required bool owner,
  }) = _Guild;

  String get iconUrl => '${ConstUrl.cdn}icons/$id/$icon.webp';

  static const dummy = Guild(
    id: GuildId('0'),
    name: 'なぞのばしょ',
    icon: '',
    owner: false,
  );

  factory Guild.fromJson(Map<String, dynamic> json) => _$GuildFromJson(json);
}

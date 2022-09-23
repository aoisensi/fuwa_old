// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:fuwa/constant/url.dart';
import 'id.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const User._();

  const factory User({
    required UserId id,
    required String username,
    required String discriminator,
    required String avatar,
  }) = _User;

  String get avatarUrl => '${ConstUrl.cdn}avatars/$id/$avatar.webp';

  static const dummy = User(
    id: UserId('0'),
    username: 'ごんべえ',
    discriminator: '0000',
    avatar: '',
  );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

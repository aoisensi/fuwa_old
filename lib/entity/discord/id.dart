// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'id.g.dart';

abstract class IdBase {
  const IdBase(this.id);
  final String id;

  @override
  String toString() => id;

  @override
  bool operator ==(Object other) =>
      other is IdBase && id == other.id && runtimeType == other.runtimeType;

  @override
  int get hashCode => Object.hash(runtimeType, id);
}

@JsonSerializable()
class UserId extends IdBase {
  const UserId(super.id);
  factory UserId.fromJson(String id) => UserId(id);
}

@JsonSerializable()
class GuildId extends IdBase {
  const GuildId(super.id);
  factory GuildId.fromJson(String id) => GuildId(id);
}

@JsonSerializable()
class ChannelId extends IdBase {
  const ChannelId(super.id);
  factory ChannelId.fromJson(String id) => ChannelId(id);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guild.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Guild _$$_GuildFromJson(Map<String, dynamic> json) => _$_Guild(
      id: GuildId.fromJson(json['id'] as String),
      name: json['name'] as String,
      icon: json['icon'] as String,
      owner: json['owner'] as bool,
    );

Map<String, dynamic> _$$_GuildToJson(_$_Guild instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'owner': instance.owner,
    };

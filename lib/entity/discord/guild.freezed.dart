// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'guild.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Guild _$GuildFromJson(Map<String, dynamic> json) {
  return _Guild.fromJson(json);
}

/// @nodoc
mixin _$Guild {
  GuildId get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  bool get owner => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GuildCopyWith<Guild> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuildCopyWith<$Res> {
  factory $GuildCopyWith(Guild value, $Res Function(Guild) then) =
      _$GuildCopyWithImpl<$Res>;
  $Res call({GuildId id, String name, String? icon, bool owner});
}

/// @nodoc
class _$GuildCopyWithImpl<$Res> implements $GuildCopyWith<$Res> {
  _$GuildCopyWithImpl(this._value, this._then);

  final Guild _value;
  // ignore: unused_field
  final $Res Function(Guild) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? icon = freezed,
    Object? owner = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as GuildId,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      owner: owner == freezed
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_GuildCopyWith<$Res> implements $GuildCopyWith<$Res> {
  factory _$$_GuildCopyWith(_$_Guild value, $Res Function(_$_Guild) then) =
      __$$_GuildCopyWithImpl<$Res>;
  @override
  $Res call({GuildId id, String name, String? icon, bool owner});
}

/// @nodoc
class __$$_GuildCopyWithImpl<$Res> extends _$GuildCopyWithImpl<$Res>
    implements _$$_GuildCopyWith<$Res> {
  __$$_GuildCopyWithImpl(_$_Guild _value, $Res Function(_$_Guild) _then)
      : super(_value, (v) => _then(v as _$_Guild));

  @override
  _$_Guild get _value => super._value as _$_Guild;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? icon = freezed,
    Object? owner = freezed,
  }) {
    return _then(_$_Guild(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as GuildId,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      owner: owner == freezed
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Guild extends _Guild with DiagnosticableTreeMixin {
  const _$_Guild(
      {required this.id,
      required this.name,
      required this.icon,
      required this.owner})
      : super._();

  factory _$_Guild.fromJson(Map<String, dynamic> json) =>
      _$$_GuildFromJson(json);

  @override
  final GuildId id;
  @override
  final String name;
  @override
  final String? icon;
  @override
  final bool owner;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Guild(id: $id, name: $name, icon: $icon, owner: $owner)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Guild'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('icon', icon))
      ..add(DiagnosticsProperty('owner', owner));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Guild &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.icon, icon) &&
            const DeepCollectionEquality().equals(other.owner, owner));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(icon),
      const DeepCollectionEquality().hash(owner));

  @JsonKey(ignore: true)
  @override
  _$$_GuildCopyWith<_$_Guild> get copyWith =>
      __$$_GuildCopyWithImpl<_$_Guild>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GuildToJson(
      this,
    );
  }
}

abstract class _Guild extends Guild {
  const factory _Guild(
      {required final GuildId id,
      required final String name,
      required final String? icon,
      required final bool owner}) = _$_Guild;
  const _Guild._() : super._();

  factory _Guild.fromJson(Map<String, dynamic> json) = _$_Guild.fromJson;

  @override
  GuildId get id;
  @override
  String get name;
  @override
  String? get icon;
  @override
  bool get owner;
  @override
  @JsonKey(ignore: true)
  _$$_GuildCopyWith<_$_Guild> get copyWith =>
      throw _privateConstructorUsedError;
}

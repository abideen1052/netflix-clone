// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'main_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MainFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() clienFailure,
    required TResult Function() serverFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? clienFailure,
    TResult Function()? serverFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? clienFailure,
    TResult Function()? serverFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ClientFailure value) clienFailure,
    required TResult Function(_serverFailure value) serverFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ClientFailure value)? clienFailure,
    TResult Function(_serverFailure value)? serverFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ClientFailure value)? clienFailure,
    TResult Function(_serverFailure value)? serverFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainFailureCopyWith<$Res> {
  factory $MainFailureCopyWith(
          MainFailure value, $Res Function(MainFailure) then) =
      _$MainFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$MainFailureCopyWithImpl<$Res> implements $MainFailureCopyWith<$Res> {
  _$MainFailureCopyWithImpl(this._value, this._then);

  final MainFailure _value;
  // ignore: unused_field
  final $Res Function(MainFailure) _then;
}

/// @nodoc
abstract class _$$ClientFailureCopyWith<$Res> {
  factory _$$ClientFailureCopyWith(
          _$ClientFailure value, $Res Function(_$ClientFailure) then) =
      __$$ClientFailureCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClientFailureCopyWithImpl<$Res>
    extends _$MainFailureCopyWithImpl<$Res>
    implements _$$ClientFailureCopyWith<$Res> {
  __$$ClientFailureCopyWithImpl(
      _$ClientFailure _value, $Res Function(_$ClientFailure) _then)
      : super(_value, (v) => _then(v as _$ClientFailure));

  @override
  _$ClientFailure get _value => super._value as _$ClientFailure;
}

/// @nodoc

class _$ClientFailure implements ClientFailure {
  const _$ClientFailure();

  @override
  String toString() {
    return 'MainFailure.clienFailure()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClientFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() clienFailure,
    required TResult Function() serverFailure,
  }) {
    return clienFailure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? clienFailure,
    TResult Function()? serverFailure,
  }) {
    return clienFailure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? clienFailure,
    TResult Function()? serverFailure,
    required TResult orElse(),
  }) {
    if (clienFailure != null) {
      return clienFailure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ClientFailure value) clienFailure,
    required TResult Function(_serverFailure value) serverFailure,
  }) {
    return clienFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ClientFailure value)? clienFailure,
    TResult Function(_serverFailure value)? serverFailure,
  }) {
    return clienFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ClientFailure value)? clienFailure,
    TResult Function(_serverFailure value)? serverFailure,
    required TResult orElse(),
  }) {
    if (clienFailure != null) {
      return clienFailure(this);
    }
    return orElse();
  }
}

abstract class ClientFailure implements MainFailure {
  const factory ClientFailure() = _$ClientFailure;
}

/// @nodoc
abstract class _$$_serverFailureCopyWith<$Res> {
  factory _$$_serverFailureCopyWith(
          _$_serverFailure value, $Res Function(_$_serverFailure) then) =
      __$$_serverFailureCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_serverFailureCopyWithImpl<$Res>
    extends _$MainFailureCopyWithImpl<$Res>
    implements _$$_serverFailureCopyWith<$Res> {
  __$$_serverFailureCopyWithImpl(
      _$_serverFailure _value, $Res Function(_$_serverFailure) _then)
      : super(_value, (v) => _then(v as _$_serverFailure));

  @override
  _$_serverFailure get _value => super._value as _$_serverFailure;
}

/// @nodoc

class _$_serverFailure implements _serverFailure {
  const _$_serverFailure();

  @override
  String toString() {
    return 'MainFailure.serverFailure()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_serverFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() clienFailure,
    required TResult Function() serverFailure,
  }) {
    return serverFailure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? clienFailure,
    TResult Function()? serverFailure,
  }) {
    return serverFailure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? clienFailure,
    TResult Function()? serverFailure,
    required TResult orElse(),
  }) {
    if (serverFailure != null) {
      return serverFailure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ClientFailure value) clienFailure,
    required TResult Function(_serverFailure value) serverFailure,
  }) {
    return serverFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ClientFailure value)? clienFailure,
    TResult Function(_serverFailure value)? serverFailure,
  }) {
    return serverFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ClientFailure value)? clienFailure,
    TResult Function(_serverFailure value)? serverFailure,
    required TResult orElse(),
  }) {
    if (serverFailure != null) {
      return serverFailure(this);
    }
    return orElse();
  }
}

abstract class _serverFailure implements MainFailure {
  const factory _serverFailure() = _$_serverFailure;
}

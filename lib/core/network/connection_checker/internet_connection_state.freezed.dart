// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'internet_connection_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InternetConnectionState {

 AppConnectionType get connectionType; AppInternetStatus get status;
/// Create a copy of InternetConnectionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InternetConnectionStateCopyWith<InternetConnectionState> get copyWith => _$InternetConnectionStateCopyWithImpl<InternetConnectionState>(this as InternetConnectionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InternetConnectionState&&(identical(other.connectionType, connectionType) || other.connectionType == connectionType)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,connectionType,status);

@override
String toString() {
  return 'InternetConnectionState(connectionType: $connectionType, status: $status)';
}


}

/// @nodoc
abstract mixin class $InternetConnectionStateCopyWith<$Res>  {
  factory $InternetConnectionStateCopyWith(InternetConnectionState value, $Res Function(InternetConnectionState) _then) = _$InternetConnectionStateCopyWithImpl;
@useResult
$Res call({
 AppConnectionType connectionType, AppInternetStatus status
});




}
/// @nodoc
class _$InternetConnectionStateCopyWithImpl<$Res>
    implements $InternetConnectionStateCopyWith<$Res> {
  _$InternetConnectionStateCopyWithImpl(this._self, this._then);

  final InternetConnectionState _self;
  final $Res Function(InternetConnectionState) _then;

/// Create a copy of InternetConnectionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? connectionType = null,Object? status = null,}) {
  return _then(_self.copyWith(
connectionType: null == connectionType ? _self.connectionType : connectionType // ignore: cast_nullable_to_non_nullable
as AppConnectionType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AppInternetStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [InternetConnectionState].
extension InternetConnectionStatePatterns on InternetConnectionState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InternetConnectionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InternetConnectionState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InternetConnectionState value)  $default,){
final _that = this;
switch (_that) {
case _InternetConnectionState():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InternetConnectionState value)?  $default,){
final _that = this;
switch (_that) {
case _InternetConnectionState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AppConnectionType connectionType,  AppInternetStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InternetConnectionState() when $default != null:
return $default(_that.connectionType,_that.status);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AppConnectionType connectionType,  AppInternetStatus status)  $default,) {final _that = this;
switch (_that) {
case _InternetConnectionState():
return $default(_that.connectionType,_that.status);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AppConnectionType connectionType,  AppInternetStatus status)?  $default,) {final _that = this;
switch (_that) {
case _InternetConnectionState() when $default != null:
return $default(_that.connectionType,_that.status);case _:
  return null;

}
}

}

/// @nodoc


class _InternetConnectionState implements InternetConnectionState {
  const _InternetConnectionState({this.connectionType = AppConnectionType.none, this.status = AppInternetStatus.offline});
  

@override@JsonKey() final  AppConnectionType connectionType;
@override@JsonKey() final  AppInternetStatus status;

/// Create a copy of InternetConnectionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InternetConnectionStateCopyWith<_InternetConnectionState> get copyWith => __$InternetConnectionStateCopyWithImpl<_InternetConnectionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InternetConnectionState&&(identical(other.connectionType, connectionType) || other.connectionType == connectionType)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,connectionType,status);

@override
String toString() {
  return 'InternetConnectionState(connectionType: $connectionType, status: $status)';
}


}

/// @nodoc
abstract mixin class _$InternetConnectionStateCopyWith<$Res> implements $InternetConnectionStateCopyWith<$Res> {
  factory _$InternetConnectionStateCopyWith(_InternetConnectionState value, $Res Function(_InternetConnectionState) _then) = __$InternetConnectionStateCopyWithImpl;
@override @useResult
$Res call({
 AppConnectionType connectionType, AppInternetStatus status
});




}
/// @nodoc
class __$InternetConnectionStateCopyWithImpl<$Res>
    implements _$InternetConnectionStateCopyWith<$Res> {
  __$InternetConnectionStateCopyWithImpl(this._self, this._then);

  final _InternetConnectionState _self;
  final $Res Function(_InternetConnectionState) _then;

/// Create a copy of InternetConnectionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? connectionType = null,Object? status = null,}) {
  return _then(_InternetConnectionState(
connectionType: null == connectionType ? _self.connectionType : connectionType // ignore: cast_nullable_to_non_nullable
as AppConnectionType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AppInternetStatus,
  ));
}


}

// dart format on

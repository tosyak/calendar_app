// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'month_calendar_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MonthCalendarEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MonthCalendarEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MonthCalendarEvent()';
}


}

/// @nodoc
class $MonthCalendarEventCopyWith<$Res>  {
$MonthCalendarEventCopyWith(MonthCalendarEvent _, $Res Function(MonthCalendarEvent) __);
}


/// @nodoc


class _Started implements MonthCalendarEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MonthCalendarEvent.started()';
}


}




/// @nodoc


class _GetEventsList implements MonthCalendarEvent {
  const _GetEventsList({required this.startDate, this.endDate});
  

 final  String startDate;
 final  String? endDate;

/// Create a copy of MonthCalendarEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetEventsListCopyWith<_GetEventsList> get copyWith => __$GetEventsListCopyWithImpl<_GetEventsList>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetEventsList&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}


@override
int get hashCode => Object.hash(runtimeType,startDate,endDate);

@override
String toString() {
  return 'MonthCalendarEvent.getEventsList(startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class _$GetEventsListCopyWith<$Res> implements $MonthCalendarEventCopyWith<$Res> {
  factory _$GetEventsListCopyWith(_GetEventsList value, $Res Function(_GetEventsList) _then) = __$GetEventsListCopyWithImpl;
@useResult
$Res call({
 String startDate, String? endDate
});




}
/// @nodoc
class __$GetEventsListCopyWithImpl<$Res>
    implements _$GetEventsListCopyWith<$Res> {
  __$GetEventsListCopyWithImpl(this._self, this._then);

  final _GetEventsList _self;
  final $Res Function(_GetEventsList) _then;

/// Create a copy of MonthCalendarEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? startDate = null,Object? endDate = freezed,}) {
  return _then(_GetEventsList(
startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$MonthCalendarState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MonthCalendarState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MonthCalendarState()';
}


}

/// @nodoc
class $MonthCalendarStateCopyWith<$Res>  {
$MonthCalendarStateCopyWith(MonthCalendarState _, $Res Function(MonthCalendarState) __);
}


/// @nodoc


class _Initial implements MonthCalendarState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MonthCalendarState.initial()';
}


}




/// @nodoc


class Loading implements MonthCalendarState {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MonthCalendarState.loading()';
}


}




/// @nodoc


class Success implements MonthCalendarState {
  const Success(final  List<Event> events): _events = events;
  

 final  List<Event> _events;
 List<Event> get events {
  if (_events is EqualUnmodifiableListView) return _events;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_events);
}


/// Create a copy of MonthCalendarState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessCopyWith<Success> get copyWith => _$SuccessCopyWithImpl<Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Success&&const DeepCollectionEquality().equals(other._events, _events));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_events));

@override
String toString() {
  return 'MonthCalendarState.success(events: $events)';
}


}

/// @nodoc
abstract mixin class $SuccessCopyWith<$Res> implements $MonthCalendarStateCopyWith<$Res> {
  factory $SuccessCopyWith(Success value, $Res Function(Success) _then) = _$SuccessCopyWithImpl;
@useResult
$Res call({
 List<Event> events
});




}
/// @nodoc
class _$SuccessCopyWithImpl<$Res>
    implements $SuccessCopyWith<$Res> {
  _$SuccessCopyWithImpl(this._self, this._then);

  final Success _self;
  final $Res Function(Success) _then;

/// Create a copy of MonthCalendarState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? events = null,}) {
  return _then(Success(
null == events ? _self._events : events // ignore: cast_nullable_to_non_nullable
as List<Event>,
  ));
}


}

/// @nodoc


class Error implements MonthCalendarState {
  const Error(this.message);
  

 final  String message;

/// Create a copy of MonthCalendarState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCopyWith<Error> get copyWith => _$ErrorCopyWithImpl<Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'MonthCalendarState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res> implements $MonthCalendarStateCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) _then) = _$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error _self;
  final $Res Function(Error) _then;

/// Create a copy of MonthCalendarState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

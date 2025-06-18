// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'campsite_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CampsiteState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CampsiteState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CampsiteState()';
}


}

/// @nodoc
class $CampsiteStateCopyWith<$Res>  {
$CampsiteStateCopyWith(CampsiteState _, $Res Function(CampsiteState) __);
}


/// @nodoc


class Initial implements CampsiteState {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CampsiteState.initial()';
}


}




/// @nodoc


class LoadingState implements CampsiteState {
  const LoadingState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CampsiteState.loading()';
}


}




/// @nodoc


class ErrorState implements CampsiteState {
  const ErrorState(this.error);
  

 final  String error;

/// Create a copy of CampsiteState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorStateCopyWith<ErrorState> get copyWith => _$ErrorStateCopyWithImpl<ErrorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorState&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'CampsiteState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $ErrorStateCopyWith<$Res> implements $CampsiteStateCopyWith<$Res> {
  factory $ErrorStateCopyWith(ErrorState value, $Res Function(ErrorState) _then) = _$ErrorStateCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$ErrorStateCopyWithImpl<$Res>
    implements $ErrorStateCopyWith<$Res> {
  _$ErrorStateCopyWithImpl(this._self, this._then);

  final ErrorState _self;
  final $Res Function(ErrorState) _then;

/// Create a copy of CampsiteState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(ErrorState(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SuccessState implements CampsiteState {
  const SuccessState({required final  List<CampsiteParams> campsites}): _campsites = campsites;
  

 final  List<CampsiteParams> _campsites;
 List<CampsiteParams> get campsites {
  if (_campsites is EqualUnmodifiableListView) return _campsites;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_campsites);
}


/// Create a copy of CampsiteState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessStateCopyWith<SuccessState> get copyWith => _$SuccessStateCopyWithImpl<SuccessState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessState&&const DeepCollectionEquality().equals(other._campsites, _campsites));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_campsites));

@override
String toString() {
  return 'CampsiteState.success(campsites: $campsites)';
}


}

/// @nodoc
abstract mixin class $SuccessStateCopyWith<$Res> implements $CampsiteStateCopyWith<$Res> {
  factory $SuccessStateCopyWith(SuccessState value, $Res Function(SuccessState) _then) = _$SuccessStateCopyWithImpl;
@useResult
$Res call({
 List<CampsiteParams> campsites
});




}
/// @nodoc
class _$SuccessStateCopyWithImpl<$Res>
    implements $SuccessStateCopyWith<$Res> {
  _$SuccessStateCopyWithImpl(this._self, this._then);

  final SuccessState _self;
  final $Res Function(SuccessState) _then;

/// Create a copy of CampsiteState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? campsites = null,}) {
  return _then(SuccessState(
campsites: null == campsites ? _self._campsites : campsites // ignore: cast_nullable_to_non_nullable
as List<CampsiteParams>,
  ));
}


}

/// @nodoc


class SearchLoadingState implements CampsiteState {
  const SearchLoadingState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchLoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CampsiteState.searchLoading()';
}


}




/// @nodoc


class SearchSuccessState implements CampsiteState {
  const SearchSuccessState({required final  List<CampsiteParams> campsites}): _campsites = campsites;
  

 final  List<CampsiteParams> _campsites;
 List<CampsiteParams> get campsites {
  if (_campsites is EqualUnmodifiableListView) return _campsites;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_campsites);
}


/// Create a copy of CampsiteState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchSuccessStateCopyWith<SearchSuccessState> get copyWith => _$SearchSuccessStateCopyWithImpl<SearchSuccessState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchSuccessState&&const DeepCollectionEquality().equals(other._campsites, _campsites));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_campsites));

@override
String toString() {
  return 'CampsiteState.searchResult(campsites: $campsites)';
}


}

/// @nodoc
abstract mixin class $SearchSuccessStateCopyWith<$Res> implements $CampsiteStateCopyWith<$Res> {
  factory $SearchSuccessStateCopyWith(SearchSuccessState value, $Res Function(SearchSuccessState) _then) = _$SearchSuccessStateCopyWithImpl;
@useResult
$Res call({
 List<CampsiteParams> campsites
});




}
/// @nodoc
class _$SearchSuccessStateCopyWithImpl<$Res>
    implements $SearchSuccessStateCopyWith<$Res> {
  _$SearchSuccessStateCopyWithImpl(this._self, this._then);

  final SearchSuccessState _self;
  final $Res Function(SearchSuccessState) _then;

/// Create a copy of CampsiteState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? campsites = null,}) {
  return _then(SearchSuccessState(
campsites: null == campsites ? _self._campsites : campsites // ignore: cast_nullable_to_non_nullable
as List<CampsiteParams>,
  ));
}


}

/// @nodoc


class FilterInitiating implements CampsiteState {
  const FilterInitiating({required this.filterParams});
  

 final  FilterParams filterParams;

/// Create a copy of CampsiteState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FilterInitiatingCopyWith<FilterInitiating> get copyWith => _$FilterInitiatingCopyWithImpl<FilterInitiating>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FilterInitiating&&(identical(other.filterParams, filterParams) || other.filterParams == filterParams));
}


@override
int get hashCode => Object.hash(runtimeType,filterParams);

@override
String toString() {
  return 'CampsiteState.filterInitiating(filterParams: $filterParams)';
}


}

/// @nodoc
abstract mixin class $FilterInitiatingCopyWith<$Res> implements $CampsiteStateCopyWith<$Res> {
  factory $FilterInitiatingCopyWith(FilterInitiating value, $Res Function(FilterInitiating) _then) = _$FilterInitiatingCopyWithImpl;
@useResult
$Res call({
 FilterParams filterParams
});




}
/// @nodoc
class _$FilterInitiatingCopyWithImpl<$Res>
    implements $FilterInitiatingCopyWith<$Res> {
  _$FilterInitiatingCopyWithImpl(this._self, this._then);

  final FilterInitiating _self;
  final $Res Function(FilterInitiating) _then;

/// Create a copy of CampsiteState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? filterParams = null,}) {
  return _then(FilterInitiating(
filterParams: null == filterParams ? _self.filterParams : filterParams // ignore: cast_nullable_to_non_nullable
as FilterParams,
  ));
}


}

/// @nodoc


class FilterLoadingState implements CampsiteState {
  const FilterLoadingState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FilterLoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CampsiteState.filterLoading()';
}


}




/// @nodoc


class FilterResultState implements CampsiteState {
  const FilterResultState({required final  List<CampsiteParams> campsites}): _campsites = campsites;
  

 final  List<CampsiteParams> _campsites;
 List<CampsiteParams> get campsites {
  if (_campsites is EqualUnmodifiableListView) return _campsites;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_campsites);
}


/// Create a copy of CampsiteState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FilterResultStateCopyWith<FilterResultState> get copyWith => _$FilterResultStateCopyWithImpl<FilterResultState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FilterResultState&&const DeepCollectionEquality().equals(other._campsites, _campsites));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_campsites));

@override
String toString() {
  return 'CampsiteState.filterResult(campsites: $campsites)';
}


}

/// @nodoc
abstract mixin class $FilterResultStateCopyWith<$Res> implements $CampsiteStateCopyWith<$Res> {
  factory $FilterResultStateCopyWith(FilterResultState value, $Res Function(FilterResultState) _then) = _$FilterResultStateCopyWithImpl;
@useResult
$Res call({
 List<CampsiteParams> campsites
});




}
/// @nodoc
class _$FilterResultStateCopyWithImpl<$Res>
    implements $FilterResultStateCopyWith<$Res> {
  _$FilterResultStateCopyWithImpl(this._self, this._then);

  final FilterResultState _self;
  final $Res Function(FilterResultState) _then;

/// Create a copy of CampsiteState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? campsites = null,}) {
  return _then(FilterResultState(
campsites: null == campsites ? _self._campsites : campsites // ignore: cast_nullable_to_non_nullable
as List<CampsiteParams>,
  ));
}


}

// dart format on

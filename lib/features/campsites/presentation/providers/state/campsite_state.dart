import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:roadsurferdemo/features/campsites/domain/entities/filter_params.dart';
import 'package:roadsurferdemo/features/campsites/domain/entities/geocoding_params.dart';
import '../../../domain/entities/campsite_params.dart';

part 'campsite_state.freezed.dart';

@freezed
abstract class CampsiteState with _$CampsiteState {
  const factory CampsiteState.initial() = Initial;

  const factory CampsiteState.loading() = LoadingState;

  const factory CampsiteState.loadingAddress() = LoadingAddressState;

  const factory CampsiteState.error(String error) = ErrorState;

  const factory CampsiteState.success({required List<CampsiteParams> campsites}) = SuccessState;

  const factory CampsiteState.addressResult({required GeoCodingParams? address}) = AddressResultState;

  const factory CampsiteState.searchLoading() = SearchLoadingState;

  const factory CampsiteState.searchResult({required List<CampsiteParams> campsites}) = SearchSuccessState;

  const factory CampsiteState.filterInitiating({required FilterParams filterParams}) = FilterInitiating;

  const factory CampsiteState.filterLoading() = FilterLoadingState;

  const factory CampsiteState.filterResult({required List<CampsiteParams> campsites}) = FilterResultState;
}

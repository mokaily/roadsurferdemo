import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/campsite_params.dart';

part 'campsite_state.freezed.dart';

@freezed
abstract class CampsiteState with _$CampsiteState {
  const factory CampsiteState.initial() = Initial;

  const factory CampsiteState.error(String error) = ErrorState;

  const factory CampsiteState.loading() = LoadingState;

  const factory CampsiteState.success({required List<CampsiteParams>? campsites}) = SuccessState;
}

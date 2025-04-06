part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(Status.UNKNOWN) Status status,
    @Default(UnknownFailure()) Failure failure,
    @Default("") String gender,
    DateTime? birthDay,
    @Default("uz") String language,
    @Default("uz") String temporaryLanguage,
  }) = _ProfileState;
}

part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(Status.UNKNOWN) Status status,
    @Default(UnknownFailure()) Failure failure,
    @Default("") String gender,
    DateTime? birthDay,
    @Default("en") String language,
    @Default("en") String temporaryLanguage,
    @Default(Colors.blue) Color selectedColor, // Rang qo'shildi
  }) = _ProfileState;
}

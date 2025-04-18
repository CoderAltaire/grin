part of 'get_all_files_cubit.dart';

@freezed
class GetAllFilesState with _$GetAllFilesState {
  const factory GetAllFilesState({
    @Default(Status.UNKNOWN) Status status,
    @Default(UnknownFailure()) Failure failure,
    @Default([]) List<AllFilesModel> allFiles,
  }) = _GetAllFilesState;
}

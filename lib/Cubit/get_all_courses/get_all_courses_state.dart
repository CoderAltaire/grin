part of 'get_all_courses_cubit.dart';

@freezed
class GetAllCoursesState with _$GetAllCoursesState {
  const factory GetAllCoursesState({
    @Default(Status.UNKNOWN) Status status,
    @Default(UnknownFailure()) Failure failure,
  }) = _GetAllCoursesState;
}

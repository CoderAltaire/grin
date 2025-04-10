import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grin/core/api/main_app/api_service.dart';
import 'package:grin/core/api/main_app/http_result.dart';
import 'package:grin/core/constants/constants.dart';
import 'package:grin/core/error/failure.dart';

part 'get_all_courses_state.dart';
part 'get_all_courses_cubit.freezed.dart';

class GetAllCoursesCubit extends Cubit<GetAllCoursesState> {
  GetAllCoursesCubit() : super(GetAllCoursesState());
  Future<void> getAllCourses() async {
    emit(state.copyWith(status: Status.LOADING));
    final HttpResult result = await ApiService.getAllCourses();
    print(result.result.toString());
    if (result.isSuccess) {
      emit(state.copyWith(status: Status.SUCCESS));
    } else {
      emit(state.copyWith(status: Status.ERROR));
    }
  }
}

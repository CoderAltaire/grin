import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grin/core/api/main_app/api_service.dart';
import 'package:grin/core/api/main_app/http_result.dart';
import 'package:grin/core/constants/constants.dart';
import 'package:grin/core/error/failure.dart';
import 'package:grin/model/all_courses_model.dart';

part 'get_all_courses_state.dart';
part 'get_all_courses_cubit.freezed.dart';

class GetAllCoursesCubit extends Cubit<GetAllCoursesState> {
  GetAllCoursesCubit() : super(const GetAllCoursesState());

  Future<void> getAllCourses() async {
    emit(state.copyWith(status: Status.LOADING));

    final HttpResult result = await ApiService.getAllCourses();
    print(result.result.toString());

    if (result.isSuccess) {
      try {
        final AllCourses model = AllCourses.fromJson(result.result);
        emit(state.copyWith(
          status: Status.SUCCESS,
          allCourses: model,
        ));
      } catch (e) {
        print("Model parse error: $e");
        emit(state.copyWith(status: Status.ERROR));
      }
    } else {
      emit(state.copyWith(status: Status.ERROR));
    }
  }
}

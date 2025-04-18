import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grin/core/api/main_app/api_service.dart';
import 'package:grin/core/api/main_app/http_result.dart';
import 'package:grin/core/constants/constants.dart';
import 'package:grin/core/error/failure.dart';
import 'package:grin/model/allfiles_model.dart';

part 'get_all_files_state.dart';
part 'get_all_files_cubit.freezed.dart';

class GetAllFilesCubit extends Cubit<GetAllFilesState> {
  GetAllFilesCubit() : super(GetAllFilesState());
  Future<void> getAllFiles() async {
    emit(state.copyWith(status: Status.LOADING));
    final HttpResult result = await ApiService.getAllFiles();
    print(result.result.toString());
    if (result.isSuccess) {
      print(result.result.toString());

      final List<dynamic> data = result.result;
      final allFiles = data.map((e) => AllFilesModel.fromJson(e)).toList();

      emit(state.copyWith(status: Status.SUCCESS, allFiles: allFiles));

      emit(state.copyWith(status: Status.SUCCESS, allFiles: allFiles));
    } else {
      emit(state.copyWith(status: Status.ERROR));
    }
  }
}

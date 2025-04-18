import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grin/core/api/main_app/api_service.dart';
import 'package:grin/core/api/main_app/http_result.dart';
import 'package:grin/core/constants/constants.dart';
import 'package:grin/core/error/failure.dart';
import 'package:grin/core/service/local_data_sources/hive_names.dart';
import 'package:grin/model/hive_models/user_data_model.dart';
part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  Future<void> phoneSend(String phone, String password) async {
    emit(state.copyWith(status: Status.LOADING));
    HttpResult result = await ApiService.login(phone, password);

    print("_______________________CLOSED__________________________");

    final data = result.result['data'];

    if (result.isSuccess) {
      UserDataModel userDataModel = UserDataModel(
        fullname: data['fullname'] ?? "no data",
        phone_number: phone,
        user_password: password,
        user_role: data['role'] ?? "no data",
      );
      print(result.result.toString());
      HiveBoxes.userDatas.put(phone, userDataModel);
      HiveBoxes.acces_token.put('acces_token', result.result['token']);

      emit(state.copyWith(phone: phone, status: Status.SUCCESS));
    } else {
      emit(state.copyWith(status: Status.ERROR));
    }
  }
}

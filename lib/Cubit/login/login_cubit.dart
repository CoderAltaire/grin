import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grin/core/api/main_app/api_service.dart';
import 'package:grin/core/api/main_app/http_result.dart';
import 'package:grin/core/constants/constants.dart';
import 'package:grin/core/error/failure.dart';
part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  Future<void> phoneSend(String phone, String password) async {
    emit(state.copyWith(status: Status.LOADING));
    print("111");
    HttpResult result = await ApiService.login(phone, password);
    print("22");

    print(result.statusCode.toString());
    print(result.result.toString());

    print(phone);
    print(password);

    print("_______________________CLOSED__________________________");
    if (result.isSuccess) {
      print("33");

      emit(state.copyWith(phone: phone, status: Status.SUCCESS));
    } else {
      print("444");

      emit(state.copyWith(status: Status.ERROR));
    }
  }
}

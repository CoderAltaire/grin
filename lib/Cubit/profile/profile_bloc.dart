import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grin/core/constants/constants.dart';
import 'package:grin/core/error/failure.dart';
part 'profile_bloc.freezed.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileState());

  FutureOr<void> selectGender(String gender, {DateTime? birthDay}) async {
    emit(state.copyWith(gender: gender, birthDay: birthDay ?? state.birthDay));
  }

  FutureOr<void> selectBirthDay(DateTime birthDay) async {
    emit(state.copyWith(birthDay: birthDay));
  }

  FutureOr<void> enterLang(String lang) async =>
      emit(state.copyWith(temporaryLanguage: lang, status: Status.UNKNOWN));
}


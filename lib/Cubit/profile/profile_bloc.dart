import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grin/core/constants/constants.dart';
import 'package:grin/core/error/failure.dart';
import 'package:grin/core/service/local_data_sources/hive_names.dart';
import 'package:grin/core/values/app_colors.dart';
part 'profile_bloc.freezed.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileState());

  Future<void> enterLang(String lang) async {
    HiveBoxes.applanguage.put("language", lang);
    emit(state.copyWith(
      language: lang,
      temporaryLanguage: lang,
      status: Status.LOADING,
    ));
    await saveLanguage();
    emit(state.copyWith(
      status: Status.SUCCESS,
    ));
  }

  Future<void> saveLanguage() async {
    await HiveBoxes.applanguage.put('language', state.language);
  }

  // Future<void> loadLanguage() async {
  //   final savedLang = HiveBoxes.applanguage.get('language') ?? 'uz';
  //   emit(state.copyWith(
  //     language: savedLang,
  //     temporaryLanguage: savedLang,
  //     status: Status.SUCCESS,
  //   ));
  // }
}

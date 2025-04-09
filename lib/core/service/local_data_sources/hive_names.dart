import 'package:flutter/widgets.dart';
import 'package:grin/model/hive_models/user_data_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveBoxes {
  const HiveBoxes._();

  static final Box<UserDataModel> userDatas = Hive.box(HiveBoxNames.userData);
  static final Box<String> applanguage = Hive.box(HiveBoxNames.appLanguage);
  static final Box<Color> primaryColor = Hive.box(HiveBoxNames.primaryColor);
  static final Box<dynamic> profilePhoto = Hive.box(HiveBoxNames.profilePhoto);

  static Future<void> clearAllBoxes() async {
    await Future.wait([]);
    userDatas.clear();
    applanguage.clear();
    profilePhoto.clear();
  }
}

class HiveBoxNames {
  static const String userData = "userData";
  static const String appLanguage = "appLanguage";
  static const String primaryColor = "primaryColor";
  static const String profilePhoto = "profilePhoto";
}

import 'package:flutter/widgets.dart';
import 'package:grin/core/service/local_data_sources/hive_names.dart';
import 'package:grin/model/hive_models/user_data_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as pp;

class HiveService {
  const HiveService._();
  static Future<void> init() async {
    final dir = await pp.getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    Hive.registerAdapter(UserDataModelAdapter());

    await Hive.openBox<UserDataModel>(HiveBoxNames.userData);
    await Hive.openBox<String>(HiveBoxNames.appLanguage);
    await Hive.openBox<Color>(HiveBoxNames.primaryColor);
    await Hive.openBox<dynamic>(HiveBoxNames.profilePhoto);
  }
}

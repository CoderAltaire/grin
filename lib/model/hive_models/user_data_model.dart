import 'package:grin/core/service/local_data_sources/adapters.dart';
import 'package:hive/hive.dart';

part 'user_data_model.g.dart';

@HiveType(typeId: 0, adapterName: HiveAdapters.userData)
class UserDataModel extends HiveObject {
  @HiveField(0)
  final String fullname;

  @HiveField(1)
  final String phone_number;

  @HiveField(2)
  final String user_password;

  @HiveField(3)
  final String user_role;

  UserDataModel({
    required this.fullname,
    required this.phone_number,
    required this.user_password,
    required this.user_role,
  });

  // fromJson
  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      fullname: json['fullname'],
      phone_number: json['phone_number'],
      user_password: json['user_password'],
      user_role: json['user_role'],
    );
  }

  // toJson
  Map<String, dynamic> toJson() {
    return {
      'fullname': fullname,
      'phone_number': phone_number,
      'user_password': user_password,
      'user_role': user_role,
    };
  }
}

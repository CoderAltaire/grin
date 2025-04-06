// import 'dart:convert';
// import 'package:hive_flutter/hive_flutter.dart';

// enum MainBoxKeys { address, basket }

// mixin class MainBoxMixin {
//   // static late Box<AddressModel> mainBox;
//   // static late Box<dynamic> basketBox;

//   static const _boxName = 'user_address';
//   static const _basketBoxName = 'basket_products';

//   static Future<void> initHive(String prefixBox) async {
//     // Initialize hive (persistent database)
//     await Hive.initFlutter();

//     // Register the adapter
//     // Hive.registerAdapter(AddressModelAdapter());

//     // Open the boxes
//     mainBox = await Hive.openBox<AddressModel>("$prefixBox$_boxName");
//     basketBox = await Hive.openBox<dynamic>("$prefixBox$_basketBoxName");
//   }

//   Future<void> addData<T>(MainBoxKeys key, AddressModel value) async {
//     await mainBox.put(key.name, value);
//   }

//   AddressModel? getData(MainBoxKeys key) {
//     return mainBox.get(key.name);
//   }

// }

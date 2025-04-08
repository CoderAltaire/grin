import 'dart:convert';

import 'package:grin/core/routes/imports.dart';
import 'package:path_provider/path_provider.dart';

class FileService {
  static FileService? _instance;
  FileService._();
  factory FileService() => _instance ?? FileService._();

  Future<void> setBool({
    required String key,
    required bool data,
  }) async {
    File file = await getFile();
    String fileData = await file.readAsString();
    Map<String, dynamic> map = jsonDecode(fileData);
    map.update(
      key,
      (value) => data,
      ifAbsent: () => data,
    );
    String prettyJson = const JsonEncoder.withIndent(' ').convert(map);
    await file.writeAsString(prettyJson);
  }

  Future<bool> getBool(String key) async {
    File file = await getFile();
    String fileData = await file.readAsString();
    Map<String, dynamic> map = jsonDecode(fileData);
    return map[key] ?? false;
  }

  Future<File> getFile() async {
    Directory dir = await getTemporaryDirectory();
    File file = File('${dir.path}/app_data.json');
    if (!(await file.exists())) {
      await file.writeAsString('{}');
    }
    return file;
  }
}

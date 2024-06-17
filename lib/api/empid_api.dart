import 'dart:math';

import '../const/uri.dart';

Future<bool> checkEmpId(int empId) async {
  try {
    final response = await UriConst().checkEmpIdUri(v: empId);

    if (response.statusCode == 200) {
      print("有効");
      return true;
    } else if (response.statusCode == 409) {
      print("無効");
      return false;
    } else {
      print("エラー発生:ステータスコード: ${response.statusCode}");
      throw Exception('従業員IDチェック失敗');
    }
  } catch (e) {
    print("従業員IDチェック中にエラー発生$e");
    throw Exception('従業員IDチェック中にエラー発生');
  }
}

Future<bool?> validateEmpId(String empId) async {
  try {
    bool empcheck = await checkEmpId(int.parse(empId));
    if (empcheck) {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    return null;
  }
}

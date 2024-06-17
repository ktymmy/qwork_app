import 'package:http/http.dart' as http;
import 'dart:convert';
import '.././const/uri.dart';

Future<void> postDataToServer(
    int empId, String fName, String gName, String pass) async {
  try {
    var response = await http.post(
      UriConst().addemployee,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'emp_id': empId,
        'f_name': fName,
        'g_name': gName,
        'pass': pass,
      }),
    );

    var responseBody = jsonDecode(response.body);

    if (response.statusCode == 201) {
      print('成功！！！！: ${responseBody}');
    } else if (response.statusCode == 400) {
      print('クライアントエラー: ${responseBody['message']}');
    } else if (response.statusCode == 409) {
      return print('重複！！！: ${responseBody['message']}');
    } else {
      print('エラー: サーバーが ${response.statusCode} ステータスコードを返しました。');
      print('レスポンス内容: ${responseBody['message']}');
    }
  } catch (error) {
    print('エラー!!!!!!!!: $error');
  }
}

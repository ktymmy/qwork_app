import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> postDataToServer(
    int empId, String fName, String gName, String pass) async {
  try {
    final Uri url = Uri.parse('http://localhost:1323/addemployee');

    var request = http.MultipartRequest('POST', url)
      ..fields['emp_id'] = empId.toString()
      ..fields['f_name'] = fName
      ..fields['g_name'] = gName
      ..fields['pass'] = pass;

    var response = await request.send();

    var responseData = await http.Response.fromStream(response);
    var responseBody = jsonDecode(responseData.body);

    if (response.statusCode == 201) {
      print('成功: ${responseBody}');
    } else if (response.statusCode == 400) {
      print('クライアントエラー: ${responseBody['message']}');
    } else if (response.statusCode == 409) {
      print('競合: ${responseBody['message']}');
    } else {
      print('エラー: サーバーが ${response.statusCode} ステータスコードを返しました。');
      print('レスポンス内容: ${responseBody['message']}');
    }
  } catch (error) {
    print('エラー!!!!!!!!: $error');
  }
}

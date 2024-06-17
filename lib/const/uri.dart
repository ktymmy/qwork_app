import 'package:http/http.dart' as http;

class UriConst {
  final Uri addemployee = Uri.parse('http://localhost:1323/addemployee');
  checkEmpIdUri({required int v}) {
    return http.get(Uri.parse('http://localhost:1323/checkempid?emp_id=$v'));
  }
}

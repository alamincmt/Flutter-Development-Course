import 'package:http/http.dart' as http;

class APIService{
  Future<String> login(String username, String password) async{
    var url = Uri.https('euit-flutter.bondhusoft.com', '/api-test/login.php');
    var response = await http.post(url, body: {
      'username': username,
      'password': password
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    return response.body;
  }
}
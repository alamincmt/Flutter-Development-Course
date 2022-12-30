import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quiz_app/model/sura_data.dart';
import 'package:quiz_app/model/user_data.dart';

class APIService{

  Future<String> login(String username, String password) async{
    var url = Uri.http('euit-flutter.bondhusoft.com', '/api-test/login.php');
    var response = await http.post(url, body: {
      'username': username,
      'password': password
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    return response.body;
  }

  Future<List<SuraData>> suraList() async{
    var url = Uri.http('api.alquran.cloud', '/v1/surah');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Sura List Response body: ${response.body}');

    var mainResponse = json.decode(response.body);
    var suraJSONArr = mainResponse["data"];
    List<SuraData> suraList = [];

    for (var singleSura in suraJSONArr) {
      SuraData sura = SuraData(singleSura["number"], singleSura["name"], singleSura["englishName"], singleSura["englishNameTranslation"], singleSura["numberOfAyahs"], singleSura["revelationType"]);
      //Adding sura to the list.
      suraList.add(sura);
    }
    return suraList;
  }

  Future<List<UserData>> userList() async{
    var url = Uri.https('reqres.in', '/api/users?page=2');
    var response = await http.get(url);
    print('Response Status:: ${response.statusCode}');
    print('User List API Response body: ${response.body}');

    var mainResponse = json.decode(response.body);
    var userJSONArr = mainResponse["data"];
    List<UserData> userList = [];

    for (var singleUser in userJSONArr) {
      UserData userData = UserData(singleUser["id"], singleUser["email"], singleUser["first_name"], singleUser["last_name"], singleUser["avatar"]);
      //Adding user to the list.
      userList.add(userData);
    }
    return userList;
  }
}
import 'package:http/http.dart' as http;
import 'dart:convert';

Future loginUser(String email, String passwordd) async {
  String apiurl = 'https://reqres.in/api/register';
  final response =
      await http.post(apiurl, headers: {"Accept": "Application/json"},
          //body: {'device_id': deviceidd, 'password': passwordd});
          body: {'email': email, 'password': passwordd});
  var convertrdDatatoJson = jsonDecode(response.body);
  return convertrdDatatoJson;
}

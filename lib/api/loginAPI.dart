import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:yukhiking_app/model/profileModel.dart';

Future<List<UserData>> fetchUser() async {
  final response = await http.get(Uri.parse('http://localhost:8000/api/users'));

  if (response.statusCode != 200) {
    throw "Gagal dalam fetching data";
  } else {
    List body = jsonDecode(response.body);
    List<UserData> userList = [];
    for (var user in body) {
      userList.add(UserData(
        ID_user: user['ID_user'],
        username: user['username'],
        alamat: user['alamat'],
      ));
    }
    return userList;
  }
}

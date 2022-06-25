import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:yukhiking_app/model/profileModel.dart';

Future<List<UserData>> fetchUser() async {
  final response = await http.get(Uri.parse('http://localhost:8000/api/users'));

  if (response.statusCode == 200) {
    List body = jsonDecode(response.body);
    List<UserData> userList = [];
    for (var user in body) {
      userList.add(UserData(
        ID_user: user['ID_user'],
        username: user['username'],
        alamat: user['alamat'],
        password: user['password'],
      ));
    }
    return userList;
  } else {
    throw Exception("Data can't be reached.");
  }
}

Future createUser(String username, alamat, password) async {
  final response =
      await http.post(Uri.parse('http://localhost:8000/api/users/create'),
          headers: <String, String>{
            'Content-type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'username': username,
            'alamat': alamat,
            'password': password,
          }));

  if (response.statusCode != 200) {
    throw Exception('Failed to create an account. Try later.');
  }
}

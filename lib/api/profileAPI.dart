import 'dart:convert';
import 'package:http/http.dart' as http;
// if needed: flutter pub add http
import 'package:yukhiking_app/model/profileModel.dart';

Future<List<ToDoItems>> getTodos() async {
  var response =
      await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));
  if (response.statusCode != 200) {
    throw "Gagal dalam fetching data";
  }
  List body = jsonDecode(response.body);
  List<ToDoItems> finalList = [];
  for (var todos in body) {
    finalList.add(ToDoItems(
        userId: todos["userId"],
        id: todos["id"],
        title: todos["title"],
        completed: todos["completed"]));
  }
  return finalList;
}


Future getUserData(int id) async {
  var response;
  try {
    response =
        await http.get(Uri.parse("http://localhost:8000/api/users/${id}"));
  } catch (e) {
    // List<UserData> exceptionList = [];
    // exceptionList.add(UserData(
    //   ID_user: 999,
    //   username: 'defaultUserName',
    //   alamat: 'default',
    //   password: 'test',
    // ));
    // return exceptionList;
    UserData exceptionData = UserData(
      ID_user: 999,
      username: 'defaultUserName',
      alamat: 'default',
      password: 'test',
    );
    return exceptionData;
  }

  if (response.statusCode != 200) {
    throw "Gagal dalam fetching data";
  }

  // List body = jsonDecode(response.body);
  // List<UserData> finalList = [];
  // for (var user in body) {
  //   finalList.add(UserData(
  //     ID_user: user["ID_user"],
  //     username: user["username"],
  //     // password: user["password"],
  //     alamat: user["alamat"],
  //     password: user["password"],
  //   ));
  // }
  var body = jsonDecode(response.body);
  final UserData data = UserData(
    ID_user: body[0]['ID_user'],
    username: body[0]['username'],
    alamat: body[0]['alamat'],
    password: body[0]['password'],
  );

  return data;
}


Future<bool> sendUserData(String id, String username, String alamat) async {
  final response = await http.post(
    Uri.parse('http://localhost:8000/api/users/update'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Access-Control-Allow-Origin': '*',
    },
    body: jsonEncode(<String, String>{
      'ID_user': id,
      'username': username,
      'alamat': alamat,
    }),
  );
  if (response.statusCode != 200) {
    return false;
  } else {
    return true;
  }
}

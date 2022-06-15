import 'dart:convert';
import 'package:http/http.dart' as http;
// if needed: flutter pub add http
import 'package:yukhiking_app/model/profileModel.dart';

Future<List<ToDoItems>> getTodos() async {
  var response = await http.get(
    Uri.parse("https://jsonplaceholder.typicode.com/todos")
  );
  if (response.statusCode != 200) {
    throw "Gagal dalam fetching data";
  }
  List body = jsonDecode(response.body);
  List<ToDoItems> finalList = [];
  for (var todos in body) {
    finalList.add(
      ToDoItems(
        userId: todos["userId"],
        id: todos["id"],
        title: todos["title"],
        completed: todos["completed"]
      )
    );
  }
  return finalList;
}

Future<List<UserData>> getUserData() async {
  var response;
  try {
    response = await http.get(
      Uri.parse("http://localhost:8000/api/users")
    );
  } catch(e) {
    List<UserData> exceptionList = [];
    exceptionList.add(
      UserData(
        ID_user: 999,
        username: 'defaultUserName',
        alamat: 'default'
      )
    );
    return exceptionList;
  }
  
  if (response.statusCode != 200) {
    throw "Gagal dalam fetching data";
  }
  List body = jsonDecode(response.body);
  List<UserData> finalList = [];
  for (var user in body) {
    finalList.add(
      UserData(
        ID_user: user["ID_user"],
        username: user["username"],
        // password: user["password"],
        alamat: user["alamat"]
      )
    );
  }
  return finalList;
}

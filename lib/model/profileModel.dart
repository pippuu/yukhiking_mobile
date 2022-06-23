class ToDoItems {
  final int userId, id;
  final String title;
  final bool completed;

  ToDoItems(
      {required this.userId,
      required this.id,
      required this.title,
      required this.completed});
}

class UserData {
  final int ID_user;
  final String username, alamat;
  final String password;

  UserData(
      {required this.ID_user,
      required this.username,
      required this.password,
      required this.alamat});
}

class UserDataToSend {
  final int id;
  final String username, alamat;
  UserDataToSend(
    this.id,
    this.username,
    this.alamat
  );
}

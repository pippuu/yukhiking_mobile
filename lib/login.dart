import 'package:dbcrypt/dbcrypt.dart';
import 'package:flutter/material.dart';
import 'package:yukhiking_app/api/loginAPI.dart';
import 'package:yukhiking_app/model/profileModel.dart';
import 'package:yukhiking_app/main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late Future<List<UserData>> futureUser = fetchUser();
  final usernameIn = TextEditingController();
  final passIn = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var id_user, username_user, address_user;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: FutureBuilder(
              future: futureUser,
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasData) {
                  List<UserData> userList = snapshot.data as List<UserData>;
                  return Container(
                    constraints: const BoxConstraints(
                      minWidth: 250,
                      maxWidth: 450,
                    ),
                    width: MediaQuery.of(context).size.width - 400,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: const Image(
                            image: AssetImage('assets/images/logo.png'),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        TextFormField(
                          controller: usernameIn,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Username',
                          ),
                        ),
                        TextFormField(
                          obscureText: true,
                          controller: passIn,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Password',
                          ),
                        ),
                        SizedBox(height: 40.0),
                        ElevatedButton(
                          child: const Text('Login',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 43, 43, 43))),
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            fixedSize:
                                MaterialStateProperty.all(const Size(150, 40)),
                          ),
                          onPressed: () {
                            if (usernameIn.text != "" && passIn.text != "") {
                              var checker = false;
                              for (var user in userList) {
                                if (usernameIn.text == user.username) {
                                  if (new DBCrypt()
                                      .checkpw(passIn.text, user.password)) {
                                    checker = true;
                                    id_user = user.ID_user;
                                    username_user = user.username;
                                    address_user = user.alamat;
                                    break;
                                  }
                                }
                              }
                              if (checker == true) {
                                Navigator.pushNamed(context, "/home",
                                    arguments: ProfileArguments(
                                        id_user, username_user, address_user));
                              } else {
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: const Text('Warning!'),
                                    content: const Text(
                                        "Username or password doesn't match, please try again"),
                                    actions: <Widget>[
                                      Center(
                                        child: TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: const Text('OK'),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            } else {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Warning!'),
                                  content: const Text(
                                      "Username and password can't be empty. Please try again."),
                                  actions: <Widget>[
                                    Center(
                                      child: TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text('OK'),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                        ),
                        SizedBox(height: 20.0),
                        Text('or'),
                        SizedBox(height: 20.0),
                        ElevatedButton(
                          child: const Text('Register',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 131, 199, 255))),
                          style: ButtonStyle(
                            overlayColor: MaterialStateProperty.all(
                                Color.fromARGB(255, 237, 247, 255)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.transparent),
                            side: MaterialStateProperty.all(
                              const BorderSide(
                                color: Color.fromARGB(255, 131, 199, 255),
                                width: 1,
                              ),
                            ),
                            elevation: MaterialStateProperty.all(0),
                            fixedSize:
                                MaterialStateProperty.all(const Size(150, 40)),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/register');
                          },
                        ),
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('Sorry, error when fetching data, return later.');
                }

                return const CircularProgressIndicator();
              }),
        ),
      ),
    );
  }
}

class ProfileArguments {
  final int id_user;
  final String username_user;
  final String address_user;

  ProfileArguments(this.id_user, this.username_user, this.address_user);
}

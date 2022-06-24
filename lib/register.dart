import 'package:flutter/material.dart';
import 'package:yukhiking_app/api/registerAPI.dart';
import 'package:yukhiking_app/model/profileModel.dart';
import 'package:yukhiking_app/main.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late Future<List<UserData>> futureUser = fetchUser();
  final usernameIn = TextEditingController();
  final passIn = TextEditingController();
  final alamatIn = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.blue,
                                  size: 26,
                                )),
                            SizedBox(width: 10),
                            Text('Create an account',
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 20)),
                          ],
                        ),
                        SizedBox(height: 40.0),
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
                        TextFormField(
                          controller: alamatIn,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Address',
                          ),
                        ),
                        SizedBox(height: 40.0),
                        ElevatedButton(
                          child: const Text('Register',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 43, 43, 43))),
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            fixedSize:
                                MaterialStateProperty.all(const Size(150, 40)),
                          ),
                          onPressed: () {
                            if (usernameIn.text != "" &&
                                passIn.text != "" &&
                                alamatIn.text != "") {
                              var checker = false;
                              for (var user in userList) {
                                if (usernameIn.text == user.username) {
                                  checker = true;
                                  break;
                                }
                              }
                              if (checker == true) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: const Text('Warning!'),
                                    content: const Text(
                                        "Username already existed. Please try using another username."),
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
                              } else {
                                createUser(usernameIn.text, alamatIn.text,
                                    passIn.text);
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          title: const Text('Success!'),
                                          content: Text(
                                              'Success in creating an account!'),
                                          actions: <Widget>[
                                            Center(
                                              child: TextButton(
                                                onPressed: () => {
                                                  Navigator
                                                      .pushReplacementNamed(
                                                          context, '/login')
                                                },
                                                child: const Text(
                                                    'Return to login.'),
                                              ),
                                            ),
                                          ],
                                        ));
                              }
                            } else {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Warning!'),
                                  content: const Text(
                                      "Username, password, and address can't be empty. Please try again."),
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
                      ],
                    ),
                  );
                }

                return const CircularProgressIndicator();
              }),
        ),
      ),
    );
  }
}

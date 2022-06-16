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
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: FutureBuilder(
              future: futureUser,
              builder: (context, snapshot) {
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
                        SizedBox(height: 20.0),
                        TextFormField(
                          controller: passIn,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Password',
                          ),
                        ),
                        SizedBox(height: 70.0),
                        ElevatedButton(
                          child: Text('Login'),
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            fixedSize:
                                MaterialStateProperty.all(const Size(150, 40)),
                          ),
                          onPressed: () {
                            // for(var user in userList ) {
                            //   if((user.username == usernameIn.text) && (user.)) break;
                            // }
                            for (var user in userList) {
                              if (usernameIn.text == "admin" &&
                                  passIn.text == "admin") {
                                print(userList[0].username);
                                Navigator.pushNamed(context, '/home');
                              }
                            }
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

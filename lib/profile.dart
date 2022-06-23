import 'package:flutter/material.dart';
import 'package:yukhiking_app/main.dart';
import 'package:yukhiking_app/model/profileModel.dart';
import 'package:yukhiking_app/api/profileAPI.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10, top: 10),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    color: const Color(0xFFA5D5FF),
                    shape: BoxShape.circle,
                    border: Border.all(width: 3, color: Colors.black)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  // const Text(
                  //   'Username123',
                  //   style: TextStyle(
                  //     fontSize: 16,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  FutureBuilder(
                      future: getUserData(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const Center(
                            child: Text("Error when fetching data"),
                          );
                        }
                        if (snapshot.hasData) {
                          List<UserData> data = snapshot.data as List<UserData>;
                          if (data.isEmpty ||
                              data[0].username == 'defaultUserName') {
                            return const Center(
                              child: Text("defultUserName"),
                            );
                          }
                          return Text(
                            '${data[0].username}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }),
                  const Text('User'),
                ],
              ),
            ],
          ),
        ),
        Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.only(left: 20),
            alignment: Alignment.centerLeft,
            height: 80,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 204, 231, 255),
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: Expanded(
              child: TextButton(
                  onPressed: () {
                    navigatorKey.currentState?.pushNamed("/profile/info");
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Icon(
                        Icons.account_circle,
                        size: 30,
                        color: Colors.black,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 10),
                      ),
                      TextButton(
                        onPressed: () {
                          navigatorKey.currentState?.pushNamed("/profile/info");
                        },
                        child: const Text('Profile Info',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            )),
                      )
                    ],
                  )),
            )),
        // Container(
        //   margin: const EdgeInsets.all(10),
        //   padding: const EdgeInsets.only(left: 20),
        //   alignment: Alignment.centerLeft,
        //   height: 80,
        //   decoration: const BoxDecoration(
        //     color: Color.fromARGB(255, 204, 231, 255),
        //     borderRadius: BorderRadius.all(Radius.circular(10.0))),
        //   child: Expanded(
        //     child: TextButton(
        //       onPressed: () {
        //         navigatorKey.currentState?.pushNamed("/profile/about");
        //       },
        //       child: Row(
        //         crossAxisAlignment: CrossAxisAlignment.stretch,
        //         children: [
        //           const Icon(
        //             Icons.settings,
        //             size: 30,
        //             color: Colors.black,
        //           ),
        //           const Padding(
        //             padding: EdgeInsets.only(right: 10),
        //           ),
        //           TextButton(
        //             onPressed: () {
        //               navigatorKey.currentState?.pushNamed("/profile/about");
        //             },
        //             child: const Text('About',
        //               style: TextStyle(
        //                 fontSize: 16,
        //                 color: Colors.black,
        //               )
        //             ),
        //           )
        //         ],
        //       )
        //     ),
        //   )
        // ),
        Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.only(left: 20),
            alignment: Alignment.centerLeft,
            height: 80,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 204, 231, 255),
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: Expanded(
              child: TextButton(
                  onPressed: () {
                    navigatorKey.currentState?.pushNamed("/profile/about");
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Icon(
                        Icons.help,
                        size: 30,
                        color: Colors.black,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 10),
                      ),
                      TextButton(
                        onPressed: () {
                          navigatorKey.currentState
                              ?.pushNamed("/profile/about");
                        },
                        child: const Text('About',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            )),
                      )
                    ],
                  )),
            )),
      ],
    );
    // End of Halaman Profile
  }
}

class InfoProfilePage extends StatefulWidget {
  const InfoProfilePage({Key? key}) : super(key: key);
  @override
  State<InfoProfilePage> createState() => _InfoProfileState();
}

class _InfoProfileState extends State<InfoProfilePage> {
  Future userList = getUserData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Profile Info'),
        )
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: FutureBuilder(
          future: userList,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text("Error when fetching data"),
              );
            }
            if (snapshot.hasData) {
              List<UserData> data = snapshot.data as List<UserData>;
              if (data.isEmpty 
              // || data[0].username == 'defaultUserName'
              ) {
                return const Center(
                  child: Text("Data is empty"),
                );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("ID: ${data[0].ID_user}"),
                  Text("Username: ${data[0].username}"),
                  ElevatedButton(
                    onPressed: () {
                      navigatorKey.currentState?.pushNamed("/profile/info/edit");
                    },
                    child: const Text('Edit username')
                  ),
                  // Text("Password: ${data[1].password}"),
                  Text("Alamat: ${data[0].alamat}"),
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        )
      )
    );
  }
}

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);
  @override
  State<EditProfilePage> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfilePage> {
  final TextEditingController _controller = TextEditingController();
  Future userList = getUserData();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Edit Profile'),
        )
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextFormField(
              controller: _controller,
              decoration: const InputDecoration(hintText: 'Enter new username'),
              ),
            // TextField(
            //   controller: _controller,
            //   decoration: const InputDecoration(hintText: 'Enter new username'),
            // ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Change username'),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutProfilePage extends StatelessWidget {
  const AboutProfilePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(
        child: Text('About Application'),
      )),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              child: Image(image: AssetImage('assets/images/logo.png')),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                'yukHiking! merupakan aplikasi layanan sewa-menyewa barang-barang untuk wisata gunung.',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                'Aplikasi ini dibuat untuk memudahkan para petualang mencari dan menyewa berbagai alat hiking dengan harga yang terjangkau.',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

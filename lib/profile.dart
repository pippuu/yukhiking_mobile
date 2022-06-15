import 'package:flutter/material.dart';
import 'package:yukhiking_app/main.dart';
import 'package:yukhiking_app/model/profileModel.dart';
import 'package:yukhiking_app/api/profileAPI.dart';

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
        )
      ),
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
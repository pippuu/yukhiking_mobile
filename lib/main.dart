import 'package:flutter/material.dart';
import 'package:yukhiking_app/api/profileAPI.dart';
import 'package:yukhiking_app/login.dart';
import 'package:yukhiking_app/model/profileModel.dart';
import 'package:yukhiking_app/profile.dart';
import 'package:yukhiking_app/explorasi.dart';
import 'package:yukhiking_app/model/ExplorasiModel.dart';
import 'package:yukhiking_app/TransaksiDetail.dart';
import 'package:yukhiking_app/model/TransaksiModel.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const yukHikingApp());
}

// Function to use custom colors
MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}

class yukHikingApp extends StatelessWidget {
  const yukHikingApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'yukHiking! Mobile Application',
      theme: ThemeData(primarySwatch: createMaterialColor(Color(0xFFA5D5FF))),
      home: const LoginPage(),
      routes: {
        "/home": (context) => const MyHomePage(title: 'yukHiking!'),
        "/profile/info": (context) => const InfoProfilePage(),
        "/profile/info/edit": (context) => const EditProfilePage(),
        "/profile/about": (context) => const AboutProfilePage(),
      },
      navigatorKey: navigatorKey,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  // final List<Widget> _widgetOptions = <Widget>[
  //   Container(
  //     child: ListView(
  //       children: [
  //         Container(
  //           padding:
  //               const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
  //           alignment: Alignment.topLeft,
  //           child: Text(
  //             'Eksplorasi',
  //             overflow: TextOverflow.ellipsis,
  //             style: const TextStyle(
  //               fontWeight: FontWeight.bold,
  //               fontSize: 25.0,
  //             ),
  //           ),
  //         ),
  //         Container(
  //           height: 200.0,
  //           color: Colors.blue[300],
  //           alignment: Alignment.center,
  //           child: Center(
  //             child: ListView.separated(
  //               itemCount: 10,
  //               itemBuilder: (BuildContext context, int idx) {
  //                 return Container(
  //                   width: 150.0,
  //                   margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
  //                   color: Colors.grey[200],
  //                 );
  //               },
  //               scrollDirection: Axis.horizontal,
  //               separatorBuilder: (BuildContext context, int idx) =>
  //                   const Divider(),
  //               shrinkWrap: true,
  //             ),
  //           ),
  //         ),
  //         GridView.count(
  //           primary: false,
  //           padding: const EdgeInsets.all(20),
  //           crossAxisSpacing: 20,
  //           mainAxisSpacing: 20,
  //           crossAxisCount: 2,
  //           shrinkWrap: true,
  //           children: <Widget>[
  //             Container(
  //               padding: const EdgeInsets.all(8),
  //               color: Colors.grey[200],
  //             ),
  //             Container(
  //               padding: const EdgeInsets.all(8),
  //               color: Colors.grey[200],
  //             ),
  //             Container(
  //               padding: const EdgeInsets.all(8),
  //               color: Colors.grey[200],
  //             ),
  //             Container(
  //               padding: const EdgeInsets.all(8),
  //               color: Colors.grey[200],
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   ),
  //   Container(
  //     child: ListView(
  //       children: [
  //         Container(
  //           padding:
  //               const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
  //           alignment: Alignment.topLeft,
  //           child: Text(
  //             'Riwayat Transaksi',
  //             overflow: TextOverflow.ellipsis,
  //             style: const TextStyle(
  //               fontWeight: FontWeight.bold,
  //               fontSize: 25.0,
  //             ),
  //           ),
  //         ),
  //         ListView(
  //           shrinkWrap: true,
  //           children: [
  //             Card(
  //               margin: const EdgeInsets.symmetric(
  //                   horizontal: 15.0, vertical: 10.0),
  //               color: Color.fromARGB(255, 204, 231, 255),
  //               child: Container(
  //                 height: 100.0,
  //               ),
  //             ),
  //             Card(
  //               margin: const EdgeInsets.symmetric(
  //                   horizontal: 15.0, vertical: 10.0),
  //               color: Color.fromARGB(255, 204, 231, 255),
  //               child: Container(
  //                 height: 100.0,
  //               ),
  //             ),
  //             Card(
  //               margin: const EdgeInsets.symmetric(
  //                   horizontal: 15.0, vertical: 10.0),
  //               color: Color.fromARGB(255, 204, 231, 255),
  //               child: Container(
  //                 height: 100.0,
  //               ),
  //             ),
  //             Card(
  //               margin: const EdgeInsets.symmetric(
  //                   horizontal: 15.0, vertical: 10.0),
  //               color: Color.fromARGB(255, 204, 231, 255),
  //               child: Container(
  //                 height: 100.0,
  //               ),
  //             ),
  //             Card(
  //               margin: const EdgeInsets.symmetric(
  //                   horizontal: 15.0, vertical: 10.0),
  //               color: Color.fromARGB(255, 204, 231, 255),
  //               child: Container(
  //                 height: 100.0,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   ),
  // Halaman Profile
  //  3

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetOptions = <Widget>[
      Container(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
              alignment: Alignment.topLeft,
              child: Text(
                'Eksplorasi',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
            ),
            Container(
              height: 260.0,
              color: Colors.blue[300],
              alignment: Alignment.center,
              child: Center(
                child: ListView.separated(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int idx) {
                    return Container(
                        width: 200.0,
                        margin: EdgeInsets.fromLTRB(5.0, 30.0, 5.0, 10.0),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                                AssetImage('assets/images/kompor listrik.jpeg'),
                            // centerSlice: Rect.fromLTWH(0.0, 0.0, 0.0, 5.0),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Kompor Listrik',
                                style: TextStyle(
                                  color: Colors.blue[200],
                                ),
                              ),
                              Text('Amogus Shop'),
                            ]));
                  },
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (BuildContext context, int idx) =>
                      const Divider(),
                  shrinkWrap: true,
                ),
              ),
            ),
            GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              crossAxisCount: 2,
              shrinkWrap: true,
              children: <Widget>[
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => detail(detailbarang[0])));
                    },
                    child: Container(
                        padding: const EdgeInsets.all(8),
                        color: Colors.grey[200],
                        child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/jashujan.png'),
                                // centerSlice: Rect.fromLTWH(0.0, 0.0, 0.0, 5.0),
                                fit: BoxFit.fill,
                              ),
                            ),
                            height: 100,
                            padding: const EdgeInsets.all(15),
                            child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Jas Hujan Gunung',
                                        style: TextStyle(
                                          color: Colors.blue[200],
                                        ),
                                      ),
                                      Text('Bogieee Shop'),
                                    ]))))),
                Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.grey[200],
                    child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/matras.jpg'),
                            // centerSlice: Rect.fromLTWH(0.0, 0.0, 0.0, 5.0),
                            fit: BoxFit.fill,
                          ),
                        ),
                        height: 100,
                        padding: const EdgeInsets.all(15),
                        child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Matras',
                                    style: TextStyle(
                                      color: Colors.blue[200],
                                    ),
                                  ),
                                  Text('Saiful Shop'),
                                ])))),
                Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.grey[200],
                    child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/tas gunung.jpg'),
                            // centerSlice: Rect.fromLTWH(0.0, 0.0, 0.0, 5.0),
                            fit: BoxFit.fill,
                          ),
                        ),
                        height: 100,
                        padding: const EdgeInsets.all(15),
                        child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Tas Gunung',
                                    style: TextStyle(
                                      color: Colors.blue[200],
                                    ),
                                  ),
                                  Text('Jojo Shop'),
                                ])))),
                Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.grey[200],
                    child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                                AssetImage('assets/images/sarung tangan.jpg'),
                            // centerSlice: Rect.fromLTWH(0.0, 0.0, 0.0, 5.0),
                            fit: BoxFit.fill,
                          ),
                        ),
                        height: 100,
                        padding: const EdgeInsets.all(15),
                        child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Sarung Tangan Gunung',
                                    style: TextStyle(
                                      color: Colors.blue[200],
                                    ),
                                  ),
                                  Text('Dio Shop'),
                                ])))),
                Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.grey[200],
                    child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                                AssetImage('assets/images/sepatu gunung.jpg'),
                            // centerSlice: Rect.fromLTWH(0.0, 0.0, 0.0, 5.0),
                            fit: BoxFit.fill,
                          ),
                        ),
                        height: 100,
                        padding: const EdgeInsets.all(15),
                        child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Sepatu Gunung',
                                    style: TextStyle(
                                      color: Colors.blue[200],
                                    ),
                                  ),
                                  Text('Anya Shop'),
                                ])))),
              ],
            ),
          ],
        ),
      ),
      Container(
        child: ListView(
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
              alignment: Alignment.topLeft,
              child: Text(
                'Riwayat Transaksi',
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: transaksi.length,
                  itemBuilder: (context, index) {
                    // final trans = transaksi[index];
                    return Card(
                      child: ListTile(
                        title:
                            Text('Nama Agent: ${transaksi[index].namaAgent}'),
                        subtitle:
                            Text('Status barang: ${transaksi[index].status}'),
                        trailing: const Icon(Icons.arrow_forward),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  TransaksiDetail(transaksi[index])));
                        },
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
      // Halaman Profile
      Column(
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
                            List<UserData> data =
                                snapshot.data as List<UserData>;
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
                            navigatorKey.currentState
                                ?.pushNamed("/profile/info");
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
      ),
      // End of Halaman Profile
    ];

    return Scaffold(
      appBar: AppBar(
        leading: Image(
          image: AssetImage('assets/images/logo.png'),
        ),
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFFA5D5FF),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Transactions',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
            backgroundColor: Colors.white,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

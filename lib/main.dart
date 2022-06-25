import 'package:flutter/material.dart';
import 'package:yukhiking_app/api/profileAPI.dart';
import 'package:yukhiking_app/login.dart';
import 'package:yukhiking_app/register.dart';
import 'package:yukhiking_app/model/profileModel.dart';
import 'package:yukhiking_app/profile.dart';
import 'package:yukhiking_app/explorasi.dart';
import 'package:yukhiking_app/model/ExplorasiModel.dart';
import 'package:yukhiking_app/transaksi.dart';
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
      initialRoute: '/login',
      // home: const MyHomePage(),
      routes: {
        "/login": (context) => const LoginPage(),
        "/home": (context) => MyHomePage(),
        "/register": (context) => const RegisterPage(),
        // "/profile": (context) => ProfilePage(),
        "/profile/info": (context) => InfoProfilePage(),
        "/profile/info/edit": (context) => const EditProfilePage(),
        "/profile/about": (context) => const AboutProfilePage(),
      },
      // onGenerateRoute: (settings) {
      //   if (settings.name == ) {
      //     final args = settings.arguments as ScreenArguments;

      //     return MaterialPageRoute(builder: (context) {
      //       return PassArgumentsScreen(id_user: args.id_user);
      //     });
      //   }
      // },
      navigatorKey: navigatorKey,
    );
  }
}

class MyHomePage extends StatefulWidget {
  // static const routeName = "/home";

  const MyHomePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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
  late final args =
      ModalRoute.of(context)!.settings.arguments as ProfileArguments;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetOptions = <Widget>[
      // ExplorasiPage(),
      ExplorasiPage(),
      TransaksiPage(),
      // Halaman Profile
      ProfilePage(
          id_user: args.id_user,
          username_user: args.username_user,
          address_user: args.address_user),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: Image(
          image: AssetImage('assets/images/logo.png'),
        ),
        title: Text(
          'yukHiking!',
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
          TextButton(
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName('/login'));
            },
            child: Text('Logout', style: TextStyle(color: Colors.black)),
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

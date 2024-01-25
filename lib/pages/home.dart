import 'package:abibas_app/components/const.dart';
import 'package:abibas_app/pages/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Abibas App',
    debugShowCheckedModeBanner: false,
    initialRoute: '/home',
    routes: {
      '/login': (context) => const LoginPage(),
      '/home': (context) => const HomePage(),
    },
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: const Center(
          child: Text(
            'ABIBAS STORE',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
          ),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text('Havidz Ubaidillah'),
              accountEmail: const Text('Ubedz123@gmail.com'),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.asset(
                    'assets/profile.png',
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              decoration: const BoxDecoration(color: kBackgroundColor),
            ),
            ListTile(
              title: const Text('Categories'),
              tileColor: kBackgroundColor,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Genders'),
              tileColor: kBackgroundColor,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Events'),
              tileColor: kBackgroundColor,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Favorite'),
              tileColor: kBackgroundColor,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Setting'),
              tileColor: kBackgroundColor,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.people_alt_rounded),
              title: const Text('Account'),
              tileColor: kBackgroundColor,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
      body: GridView.count(
        padding: const EdgeInsets.only(top: 20),
        childAspectRatio: 0.8,
        crossAxisCount: 2,
        shrinkWrap: true,
        children: [
          for (int i = 0; i < 9; i++)
            Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 221, 220, 220),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'assets/samba.jpg',
                    width: 250,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  const Text(
                    'SAMBA OG WHITE',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),
                  ),
                  const Text(
                    '\$99,00',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),

    );
  }
}

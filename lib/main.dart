import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Appbar',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Appbar icon menu',
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              print('search button is clicked');
            },
            icon: const Icon(
              Icons.search_rounded,
            ),
          ),
          IconButton(
            onPressed: () {
              print('shopping button is clicked');
            },
            icon: const Icon(
              Icons.shopping_cart_rounded,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text('sasha'),
              accountEmail: const Text('abc@efg.xyz'),
              onDetailsPressed: () {
                print('clicked');
              },
              decoration: BoxDecoration(
                color: Colors.pink[300],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage('assets/eunsol.png'),
                backgroundColor: Colors.transparent,
              ),
              otherAccountsPictures: const [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/him.png'),
                  backgroundColor: Colors.transparent,
                ),
              ],
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
                color: Colors.black,
              ),
              title: const Text('Home'),
              onTap: () {
                print('Home is Clicked');
              },
              trailing: const Icon(
                Icons.add,
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.settings,
                color: Colors.black,
              ),
              title: const Text('Settings'),
              onTap: () {
                print('Settings is Clicked');
              },
              trailing: const Icon(
                Icons.add,
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.question_answer_rounded,
                color: Colors.black,
              ),
              title: const Text('Q&A'),
              onTap: () {
                print('Q&A is Clicked');
              },
              trailing: const Icon(
                Icons.add,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

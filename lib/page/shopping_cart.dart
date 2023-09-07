import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'home_page.dart';
import 'search_page.dart';
import 'loding_page.dart';

class ForthPage extends StatefulWidget {
  const ForthPage({super.key});

  @override
  State<ForthPage> createState() => _ForthPageState();
}

class _ForthPageState extends State<ForthPage> {
  int leftImage = 1;
  int rightImage = 1;

  void randomImage() {
    leftImage = Random().nextInt(6) + 1;
    rightImage = Random().nextInt(6) + 1;
    showToast();
    setState(() {});
  }

  void showToast() {
    String message = '';
    if (leftImage == rightImage) {
      message = 'Good job!';
    } else {
      message = 'Try again!';
    }
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.pink,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      fontSize: 25,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text('Shopping cart'),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) =>
                    const MyPage(),
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero,
              ),
            );
          },
          icon: const Icon(
            Icons.home_outlined,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) =>
                      const SecondPage(),
                  transitionDuration: Duration.zero,
                  reverseTransitionDuration: Duration.zero,
                ),
              );
            },
            icon: const Icon(
              Icons.search_rounded,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) =>
                      const FifthPage(),
                  transitionDuration: Duration.zero,
                  reverseTransitionDuration: Duration.zero,
                ),
              );
            },
            icon: const Icon(
              FontAwesomeIcons.cloudSunRain,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/$leftImage.png',
                  width: 150,
                ),
                Image.asset(
                  'assets/$rightImage.png',
                  width: 150,
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                randomImage();
              },
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.pink),
                iconSize: MaterialStatePropertyAll(
                  50,
                ),
              ),
              child: const Icon(
                Icons.play_arrow_rounded,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

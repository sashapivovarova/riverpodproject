import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'home_page.dart';
import 'search_page.dart';
import 'loding_page.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Login'),
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
      body: Builder(
        builder: (context) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  style: const ButtonStyle(
                    fixedSize: MaterialStatePropertyAll(
                      Size(
                        300,
                        50,
                      ),
                    ),
                  ),
                  onPressed: () {},
                  icon: const Icon(
                    FontAwesomeIcons.google,
                    size: 30,
                  ),
                  label: const Text(
                    'Login with Google',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton.icon(
                  style: const ButtonStyle(
                    fixedSize: MaterialStatePropertyAll(
                      Size(
                        300,
                        50,
                      ),
                    ),
                  ),
                  onPressed: () {},
                  icon: const Icon(
                    FontAwesomeIcons.facebook,
                    size: 30,
                  ),
                  label: const Text(
                    'Login with Facebook',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton.icon(
                  style: const ButtonStyle(
                    fixedSize: MaterialStatePropertyAll(
                      Size(
                        300,
                        50,
                      ),
                    ),
                  ),
                  onPressed: () {},
                  icon: const Icon(
                    FontAwesomeIcons.envelope,
                    size: 30,
                  ),
                  label: const Text(
                    'Login with Email',
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

void showSnackBar(BuildContext context) {
  const snackBar = SnackBar(
    backgroundColor: Colors.teal,
    duration: Duration(
      seconds: 2,
    ),
    content: Text(
      'I think the information doesn\'t match!',
      textAlign: TextAlign.center,
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

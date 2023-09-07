import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:riverpodproject/config/palette.dart';
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
  bool isSignupScreen = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'assets/background.jpg',
                  ),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.only(
                  top: 130,
                  left: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: const TextSpan(
                        text: 'Welcome to ',
                        style: TextStyle(
                            letterSpacing: 1,
                            fontSize: 25,
                            color: Colors.black),
                        children: [
                          TextSpan(
                            text: 'Group Chat!',
                            style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Signup to continue',
                      style: TextStyle(
                        letterSpacing: 1,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 220,
            child: Container(
              padding: const EdgeInsets.all(
                20,
              ),
              height: 280,
              width: MediaQuery.of(context).size.width - 40,
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  15,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 15,
                    spreadRadius: 3,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(
                            () {
                              isSignupScreen = false;
                            },
                          );
                        },
                        child: Column(
                          children: [
                            Text(
                              'LOGIN',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: !isSignupScreen
                                    ? Palette.activeColor
                                    : Palette.textColor1,
                              ),
                            ),
                            if (!isSignupScreen)
                              Container(
                                margin: const EdgeInsets.only(
                                  top: 3,
                                ),
                                height: 2,
                                width: 55,
                                color: Colors.pink[200],
                              ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(
                            () {
                              isSignupScreen = true;
                            },
                          );
                        },
                        child: Column(
                          children: [
                            Text(
                              'SIGNUP',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: isSignupScreen
                                    ? Palette.activeColor
                                    : Palette.textColor1,
                              ),
                            ),
                            if (isSignupScreen)
                              Container(
                                margin: const EdgeInsets.only(
                                  top: 3,
                                ),
                                height: 2,
                                width: 58,
                                color: Colors.pink[200],
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      top: 15,
                    ),
                    child: Form(
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.account_circle_rounded,
                                color: Palette.iconColor,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Palette.textColor1,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    35,
                                  ),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Palette.textColor1,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    35,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 600,
            left: 65,
            child: Builder(
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
          ),
        ],
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

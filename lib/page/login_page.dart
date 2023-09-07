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
        title: const Text('Chat'),
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
              height: 400,
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
                      text: TextSpan(
                        text: 'Welcome',
                        style: const TextStyle(
                            letterSpacing: 1,
                            fontSize: 25,
                            color: Colors.black),
                        children: [
                          TextSpan(
                            text: isSignupScreen ? ' to Group Chat!' : ' back!',
                            style: const TextStyle(
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
                    Text(
                      isSignupScreen
                          ? 'Signup to continue'
                          : 'Login to continue',
                      style: const TextStyle(
                        letterSpacing: 1,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(
              milliseconds: 500,
            ),
            curve: Curves.easeIn,
            top: 220,
            child: Container(
              padding: const EdgeInsets.all(
                20,
              ),
              height: isSignupScreen ? 300 : 240,
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
                                color: Colors.pink,
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
                                color: Colors.pink,
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (isSignupScreen)
                    Container(
                      margin: const EdgeInsets.only(
                        top: 20,
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
                                hintText: 'ID',
                                hintStyle: TextStyle(
                                  fontSize: 15,
                                  color: Palette.textColor1,
                                ),
                                contentPadding: EdgeInsets.all(
                                  15,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.mail_rounded,
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
                                hintText: 'Email',
                                hintStyle: TextStyle(
                                  fontSize: 15,
                                  color: Palette.textColor1,
                                ),
                                contentPadding: EdgeInsets.all(
                                  15,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock,
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
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                  fontSize: 15,
                                  color: Palette.textColor1,
                                ),
                                contentPadding: EdgeInsets.all(
                                  15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  if (!isSignupScreen)
                    Container(
                      margin: const EdgeInsets.only(
                        top: 20,
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
                                hintText: 'ID',
                                hintStyle: TextStyle(
                                  fontSize: 15,
                                  color: Palette.textColor1,
                                ),
                                contentPadding: EdgeInsets.all(
                                  15,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock,
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
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                  fontSize: 15,
                                  color: Palette.textColor1,
                                ),
                                contentPadding: EdgeInsets.all(
                                  15,
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
          AnimatedPositioned(
            duration: const Duration(
              milliseconds: 500,
            ),
            curve: Curves.easeIn,
            top: isSignupScreen ? 480 : 420,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(15),
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xfffeb4cb),
                        Color(0xfffdeadb),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(
                      30,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 600,
            left: 0,
            right: 0,
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
                        label: Text(
                          isSignupScreen
                              ? 'Signup with Google'
                              : 'Login with Google',
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
                        label: Text(
                          isSignupScreen
                              ? 'Signup with Facebook'
                              : 'Login with Facebook',
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
                        label: Text(
                          isSignupScreen
                              ? 'Signup with Email'
                              : 'Login with Email',
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

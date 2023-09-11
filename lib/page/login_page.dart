import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:riverpodproject/model/palette.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpodproject/page/chat_page.dart';
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
  bool isLoginScreen = true;
  String userName = '';
  String userEmail = '';
  String userPassword = '';
  final _formKey = GlobalKey<FormState>();
  final _authentication = FirebaseAuth.instance;

  void _tryVaildation() {
    final isVaild = _formKey.currentState!.validate();
    if (isVaild) {
      _formKey.currentState!.save();
    }
  }

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
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
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
                              text:
                                  isLoginScreen ? ' back!' : ' to Group Chat!',
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
                        isLoginScreen
                            ? 'Login to continue'
                            : 'Signup to continue',
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
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
                padding: const EdgeInsets.all(
                  20,
                ),
                height: isLoginScreen ? 270 : 300,
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
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(
                    bottom: 20,
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
                                  isLoginScreen = true;
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
                                    color: isLoginScreen
                                        ? Palette.activeColor
                                        : Palette.textColor1,
                                  ),
                                ),
                                if (isLoginScreen)
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
                                  isLoginScreen = false;
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
                                    color: !isLoginScreen
                                        ? Palette.activeColor
                                        : Palette.textColor1,
                                  ),
                                ),
                                if (!isLoginScreen)
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
                      if (!isLoginScreen)
                        Container(
                          margin: const EdgeInsets.only(
                            top: 20,
                          ),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  onSaved: (value) {
                                    userName = value!;
                                  },
                                  onChanged: (value) {
                                    userName = value;
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your name.';
                                    }
                                    return null;
                                  },
                                  key: const ValueKey(1),
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
                                    hintText: 'Name',
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
                                  onSaved: (value) {
                                    userEmail = value!;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: (value) {
                                    userEmail = value;
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !value.contains('@')) {
                                      return 'Please enter a vaild email address.';
                                    }
                                    return null;
                                  },
                                  key: const ValueKey(2),
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
                                  onSaved: (value) {
                                    userPassword = value!;
                                  },
                                  obscureText: true,
                                  onChanged: (value) {
                                    userPassword = value;
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty || value.length < 6) {
                                      return 'Password must be at least 7 characters.';
                                    }
                                    return null;
                                  },
                                  key: const ValueKey(3),
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
                      if (isLoginScreen)
                        Container(
                          margin: const EdgeInsets.only(
                            top: 20,
                          ),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  onSaved: (value) {
                                    userEmail = value!;
                                  },
                                  onChanged: (value) {
                                    userEmail = value;
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your email address.';
                                    }
                                    return null;
                                  },
                                  key: const ValueKey(4),
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
                                  onSaved: (value) {
                                    userPassword = value!;
                                  },
                                  obscureText: true,
                                  onChanged: (value) {
                                    userPassword = value;
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty || value.length < 6) {
                                      return 'Password must be at least 7 characters.';
                                    }
                                    return null;
                                  },
                                  key: const ValueKey(5),
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
            ),
            AnimatedPositioned(
              duration: const Duration(
                milliseconds: 500,
              ),
              curve: Curves.easeIn,
              top: isLoginScreen ? 460 : 480,
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
                  child: GestureDetector(
                    onTap: () async {
                      if (!isLoginScreen) {
                        _tryVaildation();

                        try {
                          final newUser = await _authentication
                              .createUserWithEmailAndPassword(
                            email: userEmail,
                            password: userPassword,
                          );

                          await FirebaseFirestore.instance
                              .collection('user')
                              .doc(newUser.user!.uid)
                              .set(
                            {
                              'userName': userName,
                              'email': userEmail,
                            },
                          );

                          if (newUser.user != null) {
                            Navigator.pushReplacement(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation1, animation2) =>
                                        const ChatPage(),
                                transitionDuration: Duration.zero,
                                reverseTransitionDuration: Duration.zero,
                              ),
                            );
                          }
                        } catch (e) {
                          print(e);
                        }
                      }
                      if (isLoginScreen) {
                        _tryVaildation();

                        try {
                          final newUser =
                              await _authentication.signInWithEmailAndPassword(
                            email: userEmail,
                            password: userPassword,
                          );
                          if (newUser.user != null) {
                            Navigator.pushReplacement(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation1, animation2) =>
                                        const ChatPage(),
                                transitionDuration: Duration.zero,
                                reverseTransitionDuration: Duration.zero,
                              ),
                            );
                          }
                        } catch (e) {
                          print(e);
                        }
                      }
                    },
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
                      child: const Icon(
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
              top: MediaQuery.of(context).size.height - 340,
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
                            isLoginScreen
                                ? 'Login with Google'
                                : 'Signup with Google',
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
                            isLoginScreen
                                ? 'Login with Facebook'
                                : 'Signup with Facebook',
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
                            isLoginScreen
                                ? 'Login with Email'
                                : 'Signup with Email',
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
      ),
    );
  }
}

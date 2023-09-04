import 'package:flutter/material.dart';
import 'package:riverpodproject/page/home_page.dart';
import 'search_page.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  void judge() {
    if (controller.text == 'dice' && controller2.text == '1234') {
      Navigator.pushNamed(context, '/forth');
    } else {
      showSnackBar(context);
      // showDialog(
      //   context: context,
      //   builder: (context) {
      //     return Dialog(
      //       child: Container(
      //         width: MediaQuery.of(context).size.width * 0.7,
      //         height: 150,
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(10),
      //           color: Colors.white,
      //         ),
      //         child: Column(
      //           children: [
      //             const SizedBox(
      //               height: 30,
      //             ),
      //             const Text(
      //               'I think the information',
      //               textAlign: TextAlign.center,
      //               style: TextStyle(
      //                 fontSize: 20,
      //               ),
      //             ),
      //             const Text(
      //               'doesn\'t match!',
      //               textAlign: TextAlign.center,
      //               style: TextStyle(
      //                 fontSize: 20,
      //               ),
      //             ),
      //             const SizedBox(
      //               height: 20,
      //             ),
      //             TextButton(
      //               onPressed: () {
      //                 Navigator.pop(context);
      //               },
      //               style: const ButtonStyle(
      //                 iconColor: MaterialStatePropertyAll(
      //                   Colors.pink,
      //                 ),
      //               ),
      //               child: const Text('Close'),
      //             )
      //           ],
      //         ),
      //       ),
      //     );
      //   },
      // );
    }
  }

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
        ],
      ),
      body: Builder(
        builder: (context) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    top: 50,
                  ),
                ),
                Center(
                  child: Image.asset(
                    'assets/11.png',
                    width: 170,
                    height: 190,
                  ),
                ),
                Form(
                  child: Theme(
                    data: ThemeData(
                      primaryColor: Colors.pink,
                      inputDecorationTheme: const InputDecorationTheme(
                        labelStyle: TextStyle(
                          color: Colors.pink,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(40),
                      child: Column(
                        children: [
                          TextField(
                            decoration: const InputDecoration(
                              labelText: 'Enter "dice"',
                            ),
                            keyboardType: TextInputType.emailAddress,
                            controller: controller,
                            autofocus: true,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextField(
                            decoration: const InputDecoration(
                              labelText: 'Enter Password',
                            ),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            controller: controller2,
                            autofocus: true,
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              judge();
                            },
                            style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.pink),
                              iconSize: MaterialStatePropertyAll(
                                30,
                              ),
                            ),
                            child: const Icon(Icons.arrow_forward_rounded),
                          ),
                        ],
                      ),
                    ),
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

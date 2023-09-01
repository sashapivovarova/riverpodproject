import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigator',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const OnBoardingPage(),
        '/home': (context) => const MyPage(),
        '/second': (context) => const SecondPage(),
        '/third': (context) => const ThirdPage(),
      },
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      showSkipButton: true,
      skip: const Text(
        'Skip',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      onSkip: () {
        Navigator.pushNamed(context, '/home');
      },
      done: const Text(
        'Start',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      onDone: () {
        Navigator.pushNamed(context, '/home');
      },
      next: const Text(
        'Next',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      dotsContainerDecorator: const BoxDecoration(
        color: Colors.black,
      ),
      dotsDecorator: DotsDecorator(
        color: Colors.white,
        activeColor: Colors.pink,
        activeSize: const Size(
          30,
          10,
        ),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            30,
          ),
        ),
      ),
      pages: [
        PageViewModel(
          title: 'Home',
          body: 'You can look everyting',
          image: Image.asset('assets/11.png'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'Search',
          body: 'You can search everyting',
          image: Image.asset('assets/12.png'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'Shopping card',
          body: 'You can buy everyting',
          image: Image.asset('assets/13.png'),
          decoration: getPageDecoration(),
        ),
      ],
    );
  }

  PageDecoration getPageDecoration() {
    return const PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyTextStyle: TextStyle(
        fontSize: 18,
        color: Colors.white,
      ),
      imagePadding: EdgeInsets.only(
        top: 40,
      ),
      pageColor: Colors.black,
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  var titleList = [
    'Vitamin A',
    'Vitamin B',
    'Vitamin C',
    'Vitamin D',
    'Calcium',
    'Magnesium',
    'Folate',
    'Mineral',
    'Iron',
    'Probiotic'
  ];

  var imageList = [
    'assets/1.png',
    'assets/2.png',
    'assets/3.png',
    'assets/4.png',
    'assets/5.png',
    'assets/6.png',
    'assets/7.png',
    'assets/8.png',
    'assets/9.png',
    'assets/10.png',
  ];

  var description = [
    'It\'s a nutrient we really need. Feel the difference in your body day by day!',
    'It\'s a nutrient we really need. Feel the difference in your body day by day!',
    'It\'s a nutrient we really need. Feel the difference in your body day by day!',
    'It\'s a nutrient we really need. Feel the difference in your body day by day!',
    'It\'s a nutrient we really need. Feel the difference in your body day by day!',
    'It\'s a nutrient we really need. Feel the difference in your body day by day!',
    'It\'s a nutrient we really need. Feel the difference in your body day by day!',
    'It\'s a nutrient we really need. Feel the difference in your body day by day!',
    'It\'s a nutrient we really need. Feel the difference in your body day by day!',
    'It\'s a nutrient we really need. Feel the difference in your body day by day!',
  ];

  void showPopup(context, title, image, description) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  ClipRRect(
                    child: Image.asset(
                      image,
                      width: 200,
                      height: 200,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      description,
                      maxLines: 3,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: const ButtonStyle(
                        iconColor: MaterialStatePropertyAll(
                      Colors.pink,
                    )),
                    child: const Text('Close'),
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/second');
            },
            icon: const Icon(
              Icons.search_rounded,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/third');
            },
            icon: const Icon(
              Icons.shopping_cart_outlined,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: titleList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              showPopup(
                context,
                titleList[index],
                imageList[index],
                description[index],
              );
            },
            child: Card(
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.asset(
                      imageList[index],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(
                      10,
                    ),
                    child: Column(
                      children: [
                        Text(
                          titleList[index],
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: width,
                          child: Text(
                            description[index],
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Search'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            icon: const Icon(
              Icons.home_outlined,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/third');
            },
            icon: const Icon(
              Icons.shopping_cart_outlined,
            ),
          ),
        ],
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Shopping cart'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            icon: const Icon(
              Icons.home_outlined,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/second');
            },
            icon: const Icon(
              Icons.search_rounded,
            ),
          ),
        ],
      ),
    );
  }
}

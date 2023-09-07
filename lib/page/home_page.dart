import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:like_button/like_button.dart';
import 'package:riverpodproject/model/model.dart';
import 'package:riverpodproject/page/chat_page.dart';
import 'loding_page.dart';
import 'search_page.dart';
import 'login_page.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  static var nutrientName = [
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

  static var nutrientImage = [
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

  static var nutrientDescription = [
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

  final List<Nutrient> nutrientData = List.generate(
    nutrientName.length,
    (index) => Nutrient(
      name: nutrientName[index],
      image: nutrientImage[index],
      description: nutrientDescription[index],
    ),
  );

  bool isLiked = false;
  int likeCount = 0;

  void showPopup(context, title, image, description) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 450,
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
                  LikeButton(
                    size: 30,
                    isLiked: isLiked,
                    likeCount: likeCount,
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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) =>
                      const ChatPage(),
                  transitionDuration: Duration.zero,
                  reverseTransitionDuration: Duration.zero,
                ),
              );
            },
            icon: const Icon(
              Icons.chat_bubble_rounded,
            ),
          ),
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
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) =>
                      const ThirdPage(),
                  transitionDuration: Duration.zero,
                  reverseTransitionDuration: Duration.zero,
                ),
              );
            },
            icon: const Icon(
              Icons.shopping_cart_outlined,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: nutrientData.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              showPopup(
                context,
                nutrientName[index],
                nutrientImage[index],
                nutrientDescription[index],
              );
            },
            child: Card(
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.asset(
                      nutrientImage[index],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(
                      10,
                    ),
                    child: Column(
                      children: [
                        Text(
                          nutrientName[index],
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
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

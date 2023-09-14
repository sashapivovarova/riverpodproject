import 'package:flutter/material.dart';
import 'package:riverpodproject/page/home_page.dart';
import 'package:riverpodproject/page/image_widget.dart';

class ScrollEffect extends StatelessWidget {
  const ScrollEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text(
              'Sliver Appbar',
            ),
            backgroundColor: Colors.blueGrey,
            expandedHeight: 200,
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
                          const ScrollEffect(),
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                    ),
                  );
                },
                icon: const Icon(
                  Icons.mouse_rounded,
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/background.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              primary: false,
              shrinkWrap: true,
              itemCount: 20,
              itemBuilder: (context, index) {
                return ImageWidget(index: index);
              },
            ),
          ),
        ],
      ),
    );
  }
}

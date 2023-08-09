import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? timer;
  PageController pageController = PageController(initialPage: 0);
  String condition = 'INCREASE';

  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: 3), (timer) {
      final currentPage = pageController.page!.toInt();
      int nextPage = currentPage + 1;
      if (nextPage > 4) nextPage = 0;

      pageController.animateToPage(
        nextPage,
        duration: Duration(milliseconds: 800),
        curve: Curves.linear,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const List<int> imageIndexList = [1, 2, 3, 4, 5];

    return Scaffold(
      body: PageView(
        controller: pageController,
        children: imageIndexList
            .map(
              (i) => Image.asset(
                'assets/images/image_$i.jpeg',
                fit: BoxFit.cover,
              ),
            )
            .toList(),
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    timer!.cancel();
    super.dispose();
  }
}

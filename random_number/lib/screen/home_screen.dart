import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_number/component/number_row.dart';
import 'package:random_number/constant/color.dart';
import 'package:random_number/screen/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> numberList = [];
  int maxNumber = 1000;

  void onRandomNumberGenerate() {
    final rand = Random();
    Set<int> randomNumberList = {};
    while (randomNumberList.length != 3) {
      randomNumberList.add(rand.nextInt(maxNumber));
    }
    setState(() => numberList = randomNumberList.toList());
  }

  Future<void> onSettingsPop() async {
    final int? result = await Navigator.of(context).push<int?>(
      MaterialPageRoute(
        builder: (context) => SettingsScreen(
          maxNumber: maxNumber.toDouble(),
        ),
      ),
    );
    if (result != null) setState(() => maxNumber = result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Header(
                onPressed: onSettingsPop,
              ),
              _Body(numberList: numberList),
              _Footer(onPressed: onRandomNumberGenerate),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final VoidCallback onPressed;
  const _Header({
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          '랜덤숫자 생성기',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          onPressed: onPressed,
          icon: const Icon(Icons.settings, color: RED_COLOR),
        ),
      ],
    );
  }
}

class _Body extends StatelessWidget {
  final List<int> numberList;
  const _Body({
    required this.numberList,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: numberList
            .asMap()
            .entries
            .map(
              (it) => Padding(
                padding: EdgeInsets.only(
                    bottom: it.key == numberList.length - 1 ? 0.0 : 16.0),
                child: NumberRow(number: it.value),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  final VoidCallback onPressed;
  const _Footer({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: RED_COLOR,
        ),
        onPressed: onPressed,
        child: const Text('생성하기'),
      ),
    );
  }
}

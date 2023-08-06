import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      // debugShowCheckedModeBanner를 붙이지 않으면 디버그 배너가 나타난다.
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),
  );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Hot Reload의 대상이 되는 부분은 build method 하위에 있는 widget들이다.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Dart에서 16진수를 이용하려면 0x를 붙여야 한다.
      // 0x뒤에 붙는 FF는 투명도를 의미한다. ( FF: 불투명 )
      // 0xFF + 16진수 색상코드
      backgroundColor: const Color(0xFFF99231),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/image/logo.png',
          ),
          const CircularProgressIndicator(
            color: Colors.white,
          )
        ],
      ),
    );
  }
}

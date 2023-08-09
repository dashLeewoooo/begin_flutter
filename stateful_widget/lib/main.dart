import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color color = Colors.red;
  bool isShow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Study Stateful Widget'),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Center(
                  child: isShow ? HomeContainer(color: color) : Container(),
                ),
              ),
              ElevatedButton(
                onPressed: () => setState(() => color == Colors.blue ? color = Colors.red : color = Colors.blue),
                child: const Text('위젯 색상 변경'),
              ),
              const SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () => setState(() => isShow = !isShow),
                child: Text(isShow ? '위젯 삭제' : '위젯 생성'),
              )
            ],
          ),
        ));
  }
}

class HomeContainer extends StatefulWidget {
  final Color color;

  HomeContainer({super.key, required this.color}) {
    print('HomeContainer 생성자');
  }

  @override
  State<HomeContainer> createState() {
    print('HomeContainer createState');
    return _HomeContainerState();
  }
}

class _HomeContainerState extends State<HomeContainer> {
  int count = 0;

  @override
  void initState() {
    print('HomeContainer initState');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('HomeContainer didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant HomeContainer oldWidget) {
    print('HomeContainer didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    print('HomeContainer build');
    return GestureDetector(
      onTap: () => setState(() => count++),
      child: Container(
        width: 50.0,
        height: 50.0,
        color: widget.color,
        child: Center(
          child: Text(
            count.toString(),
          ),
        ),
      ),
    );
  }

  @override
  void deactivate() {
    print('HomeContainer deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    print('HomeContainer dispose');
    super.dispose();
  }
}

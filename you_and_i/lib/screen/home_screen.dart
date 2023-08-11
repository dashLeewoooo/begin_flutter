import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade100, // 기본값은 shade 500이다.
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              _TopPart(
                selectedDate: selectedDate,
                onDateTimeChanged: _onDateTimeChanged,
              ),
              _BottomPart(),
            ],
          ),
        ),
      ),
    );
  }

  _onDateTimeChanged(DateTime newDateTime) {
    setState(() => selectedDate = newDateTime);
  }
}

class _TopPart extends StatelessWidget {
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateTimeChanged;

  const _TopPart({
    super.key,
    required this.selectedDate,
    required this.onDateTimeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'You & I',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Column(
            children: [
              Text(
                '우리 처음 만난 날',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Text(
                '${selectedDate.year}년 ${selectedDate.month}월 ${selectedDate.day}일',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
          // IconButton은 Icon의 크기를 지정하는 것 보다
          // IconButton의 IconSize를 수정하는 것이 더 효과적이다.
          IconButton(
            iconSize: 60.0,
            onPressed: () {
              showCupertinoDialog(
                context: context,
                // barrierDismissible 자식 외 누르면 Dialog가 사라진다.
                barrierDismissible: true,
                builder: (BuildContext context) {
                  // 어디에 정렬을 해야하는 지 알 수 없으면 Flutter Framework는 전체화면을 덮는다.
                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: Colors.white,
                      height: 300.0,
                      child: CupertinoDatePicker(
                        initialDateTime: DateTime(now.year, now.month, now.day),
                        maximumDate: DateTime(now.year, now.month, now.day),
                        mode: CupertinoDatePickerMode.date,
                        onDateTimeChanged: onDateTimeChanged,
                      ),
                    ),
                  );
                },
              );
            },
            icon: Icon(
              Icons.favorite,
              color: Colors.pink,
            ),
          ),
          Text(
            'D + ${DateTime(now.year, now.month, now.day).difference(selectedDate).inDays + 1}',
            style: Theme.of(context).textTheme.titleMedium,
          )
        ],
      ),
    );
  }
}

class _BottomPart extends StatelessWidget {
  const _BottomPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Center(
      child: Text(
        '이쁜 사랑 하세요 :)',
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'sumFlower',
          fontSize: 40.0,
          fontWeight: FontWeight.w700,
        ),
      ),
    ));
  }
}

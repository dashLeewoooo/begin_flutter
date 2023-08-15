import 'package:flutter/cupertino.dart';

class NumberRow extends StatelessWidget {
  final int number;
  const NumberRow({
    super.key,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: number
          .toString()
          .split('')
          .map(
            (it) => Image.asset(
              'assets/images/$it.png',
              width: 50.0,
              height: 70.0,
            ),
          )
          .toList(),
    );
  }
}

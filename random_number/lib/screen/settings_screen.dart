import 'package:flutter/material.dart';
import 'package:random_number/component/number_row.dart';
import 'package:random_number/constant/color.dart';

class SettingsScreen extends StatefulWidget {
  final double? maxNumber;
  const SettingsScreen({
    super.key,
    this.maxNumber,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late double maxNumber;
  @override
  void initState() {
    widget.maxNumber != null ? maxNumber = widget.maxNumber! : maxNumber = 1000;
    super.initState();
  }

  void onButtonPressed() {
    Navigator.of(context).pop<int>(maxNumber.toInt());
  }

  void onSliderChanged(double? val) {
    setState(() => maxNumber = val!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Body(maxNumber: maxNumber),
              _Footer(
                onChanged: onSliderChanged,
                onPressed: onButtonPressed,
                maxNumber: maxNumber,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final double maxNumber;
  const _Body({required this.maxNumber});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: NumberRow(number: maxNumber.toInt()),
    );
  }
}

class _Footer extends StatelessWidget {
  final double maxNumber;
  final ValueChanged<double?> onChanged;
  final VoidCallback onPressed;

  const _Footer({
    required this.onChanged,
    required this.onPressed,
    required this.maxNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Slider(value: maxNumber, min: 1000, max: 1000000, onChanged: onChanged),
        SizedBox(
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: RED_COLOR,
            ),
            child: const Text('저장하기'),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class DailyTemperature extends StatelessWidget {
  final List<String> temperatures;

  DailyTemperature(this.temperatures);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [...temperatures.map((e) => Text(e))],
      ),
    );
  }
}

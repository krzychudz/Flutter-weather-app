import 'package:flutter/material.dart';

class TemperatureInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Image.asset(""),
          Column(
            children: [
              Text("Preasure"),
              Text("1000 hPa"),
            ],
          ),
        ],
      ),
    );
  }
}

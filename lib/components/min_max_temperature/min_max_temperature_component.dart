import 'package:flutter/material.dart';

class MinMaxTemperatureComponent extends StatelessWidget {
  String temperature;
  bool isMin;

  MinMaxTemperatureComponent({this.temperature, this.isMin});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(25, 0, 0, 0),
              offset: Offset(0.0, 2.0),
              blurRadius: 4.0,
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Image.asset(
              isMin
                  ? "assets/images/arrow_down.png"
                  : "assets/images/arrow_up.png",
            ),
            SizedBox(
              width: 16,
            ),
            Column(
              children: [
                Text(
                  isMin ? "Min" : "Max",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  temperature,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

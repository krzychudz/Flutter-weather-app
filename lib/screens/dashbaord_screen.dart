import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/landscape_vector.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            height: screenHeight * (6 / 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(24),
                topLeft: Radius.circular(24),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(25, 0, 0, 0),
                  offset: Offset(0.0, -2.0),
                  blurRadius: 4.0,
                ),
              ],
              color: Color.fromARGB(240, 255, 255, 255),
            ),
          ),
        ),
      ),
    );
  }
}

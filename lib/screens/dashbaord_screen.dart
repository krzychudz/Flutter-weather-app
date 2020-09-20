import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashbaord"),
      ),
      body: Center(
        child: Text("Dashboard Screen"),
      ),
    );
  }
}

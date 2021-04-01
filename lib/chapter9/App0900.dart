import 'package:flutter/material.dart';

void main() => runApp(App0900());

class App0900 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Positioned(
              top: 100,
              left: 100,
              child: Container(
                width: 50,
                height: 50,
                color: Colors.black,
              )),
          Positioned(
              top: 120,
              left: 1206,
              child: Container(
                width: 25,
                height: 25,
              ))
        ],
      ),
    );
  }
}

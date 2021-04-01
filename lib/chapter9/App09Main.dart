import 'package:flutter/material.dart';

import 'App0902.dart';

void main() => runApp(App09Main());

class App09Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    animation = getAnimation(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Expanded(
                  child: Stack(
                children: [
                  buildPositionedWidget(),
                ],
              )),
              buildRowOfButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRowOfButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RaisedButton(
            onPressed: () => controller.forward(), child: Text('Forward')),
        SizedBox(
          width: 8,
        ),
        RaisedButton(
          onPressed: () => controller.animateBack(0.0),
          child: Text('Backward'),
        ),
        SizedBox(
          width: 8,
        ),
        RaisedButton(
          onPressed: () => controller.reset(),
          child: Text('Reset'),
        )
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

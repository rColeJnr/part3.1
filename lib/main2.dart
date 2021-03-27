import 'package:flutter/material.dart';

void main() {
  runApp(App0702());
}

class App0702 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

const _youAre = 'You are';
const _compatible = "compatible with\nDoris D. Developer.";

class _MyHomePageState extends State<MyHomePage> {
  bool _ageSwitchValue = false;
  String _messageToUser = "$_youAre NOT $_compatible";

  /// State

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Are you compatible with Doris?"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            _buildAgeSwitch(),
            _buildResultArea(),
          ],
        ),
      ),
    );
  }

  // Build

  Widget _buildAgeSwitch() {
    return Row(children: <Widget>[
      Text("Are you 18 or older?"),
      Switch(value: _ageSwitchValue, onChanged: _updateAgeSwitch)
    ]);
  }

  Widget _buildResultArea() {
    return Row(
      children: <Widget>[
        RaisedButton(child: Text("Submit"), onPressed: _updateResults),
        SizedBox(
          width: 15.0,
        ),
        Text(
          _messageToUser,
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  /// Actions

  void _updateAgeSwitch(bool newValue) {
    setState(() {
      _ageSwitchValue = newValue;
    });
  }

  void _updateResults() {
    setState(() {
      _messageToUser = 'You are' +
          (_ageSwitchValue ? " " : " NOT ") +
          'compatible with \nDoris D. Developer.';
    });
  }
}

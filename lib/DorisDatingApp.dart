import 'package:flutter/material.dart';

void main() => runApp(App0707());

class App0707 extends StatelessWidget {
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
const _compatible = 'compatible with\nDoris D. Developer.';

enum Gender { Female, Male, Other }

String show(Gender gender) => gender.toString().replaceAll("Gender.", "");

enum Relationship { Friend, OneDate, OnGoing, Committed, Marriage }

Map<Relationship, String> nice = {
  Relationship.Friend: "Friend",
  Relationship.OneDate: "One date",
  Relationship.OnGoing: "Ongoing relationship",
  Relationship.Committed: "Commmitted",
  Relationship.Marriage: "Marriage",
};

List<DropdownMenuItem<Relationship>> _relationshipsList = [
  DropdownMenuItem(
      value: Relationship.Friend, child: Text(nice[Relationship.Friend])),
  DropdownMenuItem(
      value: Relationship.OneDate, child: Text(nice[Relationship.OneDate])),
  DropdownMenuItem(
      value: Relationship.OnGoing, child: Text(nice[Relationship.OnGoing])),
  DropdownMenuItem(
      value: Relationship.Committed, child: Text(nice[Relationship.Committed])),
  DropdownMenuItem(
      value: Relationship.Marriage, child: Text(nice[Relationship.Marriage])),
];

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _nameFieldController;
  bool _ageSwitchValue;
  Gender _genderRadioValue;
  Relationship _relationshipDropdownValue;
  double _loveFlutterSliderValue;
  String _messageToUser;
  Image _resultImage;

  /// State

  @override
  void initState() {
    super.initState();
    _nameFieldController = TextEditingController();
    _reset();
  }

  @override
  void dispose() {
    _nameFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Are you compatible with Doris?"),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildTitleImage(),
              _buildNameTextField(),
              _buildAgeSwitch(),
              _buildGenderRadio(),
              _buildRelationshipDropdown(),
              _buildLoveFlutterSlider(),
              _buildSubmitRow(),
            ],
          ),
        ),
      ),
    );
  }

  // Build

  Widget _buildTitleImage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset("Heart.png"),
        Image.asset("BrokenHeart.png"),
      ],
    );
  }

  Widget _buildNameTextField() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: TextField(
          controller: _nameFieldController,
          decoration: InputDecoration(
              labelText: "Your name:",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ))),
    );
  }

  Widget _buildAgeSwitch() {
    return _buildCommonBorder(
        child: Row(
      children: <Widget>[
        Text("Are you 18 or older?"),
        Switch(value: _ageSwitchValue, onChanged: _updateAgeSwitch),
      ],
    ));
  }

  Widget _buildGenderRadio() {
    return _buildCommonBorder(
        child: Row(
      children: <Widget>[
        Text(show(Gender.Female)),
        Radio(
          value: Gender.Female,
          groupValue: _genderRadioValue,
          onChanged: _updateGenderRatio,
        ),
        SizedBox(
          width: 25,
        ),
        Text(show(Gender.Male)),
        Radio(
          value: Gender.Male,
          groupValue: _genderRadioValue,
          onChanged: _updateGenderRatio,
        ),
        SizedBox(width: 25),
        Text(show(Gender.Other)),
        Radio(
            value: Gender.Other,
            groupValue: _genderRadioValue,
            onChanged: _updateGenderRatio)
      ],
    ));
  }

  Widget _buildRelationshipDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("What kind of relationship are you looking for?"),
        _buildDropdownButtonRow(),
      ],
    );
  }

  Widget _buildDropdownButtonRow() {
    return _buildCommonBorder(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        DropdownButton<Relationship>(
          items: _relationshipsList,
          onChanged: _updateRelationsipDropdown,
          value: _relationshipDropdownValue,
          hint: Text("Select One"),
        ),
        if (_relationshipDropdownValue != null)
          FlatButton(
              onPressed: _resetDropdown,
              child: Text(
                "Reset",
                style: TextStyle(color: Colors.blue[700]),
              )),
      ],
    ));
  }

  Widget _buildLoveFlutterSlider() {
    return _buildCommonBorder(
        child: Column(
      children: <Widget>[
        Text(
            "On a scale of 1 to 10,\nhow much do you love developing Flutter apps?"),
        Slider(
          min: 1.0,
          max: 10.0,
          divisions: 9,
          value: _loveFlutterSliderValue,
          onChanged: _updateLoveFlutterSlider,
          label: '${_loveFlutterSliderValue.toInt()}',
        )
      ],
    ));
  }

  Widget _buildSubmitRow() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          RaisedButton(child: Text("Submit"), onPressed: _updateResults),
          SizedBox(
            width: 15,
          ),
          RaisedButton(child: Text("Reset"), onPressed: () => setState(_reset)),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              children: <Widget>[
                Text(
                  _messageToUser,
                  textAlign: TextAlign.center,
                ),
                _resultImage ?? SizedBox()
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCommonBorder({Widget child}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      decoration: BoxDecoration(
        border: Border.all(width: 0.5),
        borderRadius: BorderRadius.all(Radius.circular(90)),
      ),
      child: child,
    );
  }

  // Actions

  void _reset() {
    _nameFieldController.text = "";
    _ageSwitchValue = false;
    _genderRadioValue = null;
    _relationshipDropdownValue = null;
    _loveFlutterSliderValue = 1.0;
    _messageToUser = "";
    _resultImage = null;
  }

  void _updateAgeSwitch(bool newValue) {
    setState(() {
      _ageSwitchValue = newValue;
    });
  }

  void _updateGenderRatio(Gender newValue) {
    setState(() {
      _genderRadioValue = newValue;
    });
  }

  void _updateRelationsipDropdown(Relationship newValue) {
    setState(() {
      _relationshipDropdownValue = newValue;
    });
  }

  void _resetDropdown() {
    setState(() {
      _relationshipDropdownValue = null;
    });
  }

  void _updateLoveFlutterSlider(double newValue) {
    setState(() {
      _loveFlutterSliderValue = newValue;
    });
  }

  void _updateResults() {
    bool isCompatible = _ageSwitchValue && _loveFlutterSliderValue >= 8;
    setState(() {
      _resultImage =
          Image.asset(isCompatible ? "Heart.png" : "BrokenHeart.png");
      _messageToUser = _nameFieldController.text +
          "\n" +
          _youAre +
          (isCompatible ? " " : " NOT ") +
          _compatible;
    });
  }
}

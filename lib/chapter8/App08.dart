import 'package:flutter/material.dart';

import 'App0805.dart';

void main() => runApp(App08Main());

class App08Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MovieTitlePage(),
    );
  }
}

class MovieTitlePage extends StatefulWidget {
  @override
  MovieTitlePageState createState() => MovieTitlePageState();
}

class MovieTitlePageState extends State<MovieTitlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Title'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: buildTitlePageCore(),
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final overView = '(From themoviedb.com) One day at work, unsuccessful '
      'puppeteer Craig finds a portal into the head of actor John Malkovich. '
      'The portal soon becomes a passion for anybody who '
      'enters its mad and controlling world of overtaking another human '
      'body.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        leading: IconButton(
          icon: new Icon(Icons.keyboard_backspace_rounded, color: Colors.red),
          // automaticallyImplyLeading: false - disables back button
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: buildDetailPageCore(context),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'App08.dart';

extension MoreMovieTitlePage on MovieTitlePageState {
  static bool _isFavorite = true; // you can change this to false

  goToDetailPage() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailPage(),
            settings: RouteSettings(arguments: _isFavorite)));
  }

  Widget buildTitlePageCore() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Being John Malkovich',
          textScaleFactor: 1.5,
        ),
        SizedBox(height: 16.0),
        RaisedButton.icon(
            onPressed: goToDetailPage,
            icon: Icon(Icons.arrow_forward_ios_rounded),
            label: Text('Details'))
      ],
    );
  }
}

extension MoreDeailtPage on DetailPage {
  Widget buildDetailPageCore(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          overView,
        ),
        Visibility(
          visible: ModalRoute.of(context).settings.arguments ?? false,
          child: Icon(Icons.favorite),
        )
      ],
    );
  }
}

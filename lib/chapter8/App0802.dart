import 'package:flutter/material.dart';

import 'App08.dart';

extension MoreMovieTitlePage on MovieTitlePageState {
  goToDetailPage() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPage(),
        ));
  }

  Widget buildTitlePageCore() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Being John Malkovich',
          textScaleFactor: 1.5,
        ),
        SizedBox(
          height: 16,
        ),
        RaisedButton.icon(
            onPressed: goToDetailPage,
            icon: Icon(Icons.arrow_forward_ios_rounded),
            label: Text('Details2')),
      ],
    );
  }
}

extension MoreDetailPage on DetailPage {
  Widget buildDetailPageCore(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [Text(overView)],
    );
  }
}

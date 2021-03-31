import 'package:flutter/material.dart';

import 'App08.dart';

extension MoreMovieTitlePage on MovieTitlePageState {
  static bool _isFavorite;

  goToDetailPage() async {
    _isFavorite = await Navigator.push(
        context,
        MaterialPageRoute(
              builder: (context) => DetailPage(),
            ) ??
            _isFavorite);
  }

  Widget buildTitlePageCore() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Being John Malkovich",
              textScaleFactor: 1.5,
            ),
            Visibility(
              visible: _isFavorite ?? false,
              child: Icon(Icons.favorite),
            )
          ],
        ),
        SizedBox(height: 16.0),
        RaisedButton.icon(
          icon: Icon(Icons.arrow_forward),
          label: Text('Details'),
          onPressed: goToDetailPage,
        )
      ],
    );
  }
}

extension MoreDetailPage on DetailPage {
  Widget buildDetailPageCore(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(overView),
        SizedBox(height: 16),
        RaisedButton(
          child: Text('Make it a Favorite!'),
          onPressed: () {
            Navigator.pop(context, true);
          },
        )
      ],
    );
  }
}

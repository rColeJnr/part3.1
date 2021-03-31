import 'package:flutter/material.dart';

import 'App08.dart';

extension MoreMovieTitlePage on MovieTitlePageState {
  static bool _isFavorite;

  goToDetailPage() async {
    _isFavorite = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(),
              settings: RouteSettings(
                arguments: _isFavorite,
              ),
            )) ??
        _isFavorite;
  }

  Widget buildTitlePageCore() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Being John Malkovich',
              textScaleFactor: 1.5,
            ),
            Visibility(
                visible: _isFavorite ? false : true,
                child: Icon(Icons.favorite))
          ],
        ),
        SizedBox(height: 16),
        RaisedButton.icon(
            onPressed: goToDetailPage,
            icon: Icon(Icons.arrow_forward),
            label: Text("Details")),
      ],
    );
  }
}

extension MoreDetailPage on DetailPage {
  Widget buildDetailPageCore(context) {
    final _isFavoriteArgument =
        ModalRoute.of(context).settings.arguments ?? false;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(overView),
        SizedBox(height: 16),
        RaisedButton(
          child:
              Text(_isFavoriteArgument ? 'unfavourite this' : 'Make it a fav!'),
          onPressed: () {
            Navigator.pop(context, !_isFavoriteArgument);
          },
        )
      ],
    );
  }
}

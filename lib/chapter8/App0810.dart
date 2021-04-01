// App0810.dart

import 'package:flutter/material.dart';

import 'App08.dart';

extension MoreMovieTitlePage on MovieTitlePageState {
  goToDetailPage(String movieTitle) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(),
        settings: RouteSettings(
          arguments: movieTitle,
        ),
      ),
    );
  }

  Widget buildTitlePageCore() {
    TextEditingController _controller = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        TextField(
          decoration: InputDecoration(labelText: 'Movie title:'),
          controller: _controller,
        ),
        SizedBox(height: 16.0),
        RaisedButton.icon(
          icon: Icon(Icons.arrow_forward),
          label: Text('Details'),
          onPressed: () => goToDetailPage(_controller.text),
        ),
      ],
    );
  }
}

extension MoreDetailPage on DetailPage {
  Future<String> _getMovieData(String movieTitle) {
    return updateOverview(
      movieTitle: movieTitle,
      api_key: "Parents: Don't let your sons and "
          "daughters put api keys in their code.",
    );
  }

  Widget buildDetailPageCore(context) {
    final _movieTitle = ModalRoute.of(context).settings.arguments ?? false;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        FutureBuilder<String>(
          future: _getMovieData(_movieTitle),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data);
            }
            return CircularProgressIndicator();
          },
        ),
      ],
    );
  }

  Future<String> updateOverview({String api_key, String movieTitle}) async {
    // final response = await http.get
    // return json.decode(response.body)['results'][0]['overview'];
  }
}

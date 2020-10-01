import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class SavedList extends StatefulWidget {
  @override
  _SavedList createState() => _SavedList();
}

class _SavedList extends State<SavedList> {
  final _biggerFont = TextStyle(fontSize: 18.0);

  Iterable<ListTile> _tiles(Set<WordPair> _saved) {
    return _saved.map(
      (WordPair pair) {
        return ListTile(
          title: Text(
            pair.asPascalCase,
            style: _biggerFont,
          ),
        );
      },
    );
  }

  List<Widget> _divided(Set<WordPair> _saved) {
    return ListTile.divideTiles(
      context: context,
      tiles: _tiles(_saved),
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    final Set<WordPair> arguments = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Suggestions'),
      ),
      body: ListView(children: _divided(arguments)),
    );
  }
}

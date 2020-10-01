import 'package:flutter/material.dart';

import 'components/random_words/random_words.dart';
import 'components/saved_list/saved_list.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: <String, WidgetBuilder> {
        '/': (BuildContext context) => RandomWords(),
        '/saved': (BuildContext context) => SavedList(),
      },
    ),
  );
}

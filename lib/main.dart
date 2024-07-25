import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:partic/pag2.dart';
import 'package:partic/pages/GPTplayer.dart';
import 'package:partic/pages/Player.dart';
import 'package:partic/pages/Searcher.dart';

void main() => runApp(
      MyApp(),
    );
final TextEditingController usernameController = TextEditingController();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Searcher(),
    );
  }
}

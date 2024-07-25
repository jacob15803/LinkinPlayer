import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  final String username;

  Page2({required this.username});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('lol here yor uid :$username'),
        ),
        body: Column(children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("GOOD Morning"), Icon(Icons.settings_sharp)],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text("Curent Location "), Text("Kakkanad ")],
          ),
          Row(
            children: [
              Text(
                "POpular Resatutrants ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )
            ],
          )
        ]));
  }
}

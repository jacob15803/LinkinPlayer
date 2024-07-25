import 'package:flutter/material.dart';
import 'package:partic/pages/GPTplayer.dart';
import 'package:partic/pages/Player.dart';

class Searcher extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  String storedText = "";
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        backgroundColor: Colors.black,
        body: Center(
            child: Padding(
                padding: EdgeInsets.all(20),
                child: (Column(
                  children: [
                    Text(
                      "LinkinPlayer",
                      style: TextStyle(fontSize: 25, color: Colors.grey),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                    ),
                    TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder()),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              String storedText = _controller.text;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Player12(Mtrack: storedText),
                                ),
                              );
                            },
                            child: Text("Play iT",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey))),
                      ],
                    )
                  ],
                ))))));
  }
}

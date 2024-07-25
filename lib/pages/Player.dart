import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:spotify/spotify.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class Player extends StatefulWidget {
  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  String Mtrack = "6K4t31amVTZDgR3sKmwUJJ?si=530e21288b7d4f0c";
  String clientId = "4dbd7f37808040bf8235f336280a12b1";
  String clientSecret = "4dbd7f37808040bf8235f336280a12b1";
  String songName = "The Less";
  final player = AudioPlayer();
  @override
  void initState() {
    super.initState();
    final credentials = SpotifyApiCredentials(clientId, clientSecret);
    final spotify = SpotifyApi(credentials);
    spotify.tracks.get(Mtrack).then((track) async {
      String? songName = track.name;
      if (songName != null) {
        final yt = YoutubeExplode();
        final result = await yt.search.search(songName);
        final videoId = result.first.id.value;
        var manifest = await yt.videos.streamsClient.getManifest(videoId);
        var audioUrl = manifest.audioOnly.first.url;
        player.play(UrlSource(audioUrl.toString()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(232, 128, 128, 128),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.only(top: 40)),
              Text("now playing"),
              Icon(Icons.music_note)
            ],
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 160),
              // child: ()
            ),
          ),
          Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 160)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Song_Name",
                    style: TextStyle(fontSize: 20),
                  ),
                  Icon(
                    Icons.favorite,
                    color: Colors.green,
                    size: 40,
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    "Artist_Name",
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
              ProgressBar(
                progress: Duration(milliseconds: 1000),
                buffered: Duration(milliseconds: 2000),
                total: Duration(milliseconds: 145000),
                onSeek: (duration) {
                  print('User selected a new time: $duration');
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.skip_previous,
                        size: 50,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.play_circle, size: 50)),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.skip_next, size: 50)),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

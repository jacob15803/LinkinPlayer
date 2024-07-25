import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:spotify/spotify.dart' as spotify;
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class Player12 extends StatefulWidget {
  final String Mtrack;

  Player12({required this.Mtrack});
  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player12> {
  String Mtrack = "6K4t31amVTZDgR3sKmwUJJ?si=3c5c036c919e4ec7";
  String clientId = "**";
  String clientSecret = "**";
  String songName = "";
  String artistName = "";
  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    fetchTrack();
  }

  Future<void> fetchTrack() async {
    final credentials = spotify.SpotifyApiCredentials(clientId, clientSecret);
    final spotifyApi = spotify.SpotifyApi(credentials);

    try {
      final track = await spotifyApi.tracks.get(widget.Mtrack);
      setState(() {
        songName = track.name!;
        artistName = track.artists!.first.name!;
      });

      final yt = YoutubeExplode();
      final result = await yt.search.search(songName);
      final videoId = result.first.id.value;
      var manifest = await yt.videos.streamsClient.getManifest(videoId);
      var audioUrl = manifest.audioOnly.first.url;
      player.play(UrlSource(audioUrl.toString()));
    } catch (e) {
      print('Error fetching track: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(232, 0, 0, 0),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.only(top: 40)),
              Text("Now Playing"),
              Icon(Icons.music_note)
            ],
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 160),
              child: Image.asset(
                'assets/img/nw.avif', // Ensure this path is correct
                width: 250,
                height: 250,
              ),
            ),
          ),
          Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 160)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    songName,
                    style: TextStyle(fontSize: 20, color: Colors.white),
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
                    artistName,
                    style: TextStyle(fontSize: 15, color: Colors.white),
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

import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:bunny_ear/constant.dart';
import 'package:bunny_ear/pages/home/components/audio_asset_player.dart';
import 'package:flutter/material.dart';

class AudioPlayer extends StatefulWidget {
  const AudioPlayer({Key? key}) : super(key: key);

  @override
  State<AudioPlayer> createState() => _AudioPlayerState();
}

class _AudioPlayerState extends State<AudioPlayer> {
  static const iconSize = 50.0;

  final player = AudioAssetPlayer("sample.mp3");

  late final StreamSubscription progressSubscription;
  late final StreamSubscription stateSubscription;

  double progress = 0.0;
  PlayerState state = PlayerState.STOPPED;

  late final Future initFuture;

  @override
  void initState() {
    initFuture = player.int().then((_) => {
          progressSubscription =
              player.progressStream.listen((p) => setState(() => progress = p)),
          stateSubscription = player.stateStream.listen((s) {
            setState(() => state = s);
          })
        });
    super.initState();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon( Icons.arrow_back, color: Colors.white,  ),
          onTap: () {
            Navigator.pop(context);
          } ,
        ) ,
        backgroundColor: primaryColor,
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: FutureBuilder(
            future: initFuture,
            builder: ((context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const Text("Loading....");
              }

              return Container(
                height: 400,
                child: Card(
                  elevation: 3,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.album, size: 100, color: Colors.black54,),
                        SizedBox(height: 20,),
                        Text(
                          "Sample sound",
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        SizedBox(height: 10,),
                        Text(
                          "MONSTERS INC.//GREYSON NEKRUTMAN",
                          style: Theme.of(context).textTheme.caption,
                        ),
                        SizedBox(height: 50,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildPlayButton(),
                            buildPauseButton(),
                            buildStopButton(),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(32),
                          child: LinearProgressIndicator(
                            value: progress,
                            backgroundColor: thirdColor,
                            valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
                          ),
                        )
                      ]),
                ),
              );
            })),
      )),
    );
  }

  Widget buildPlayButton() {
    if (state == PlayerState.PLAYING) {
      return const IconButton(
        onPressed: null,
        icon: Icon(
          Icons.play_arrow,
          color: Colors.grey,
          size: iconSize,
        ),
      );
    }

    return IconButton(
        onPressed: player.play,
        icon: const Icon(
          Icons.play_arrow,
          color: primaryColor,
          size: iconSize,
        ));
  }

  Widget buildStopButton() {
    if (state == PlayerState.STOPPED) {
      return const IconButton(
        onPressed: null,
        icon: Icon(
          Icons.stop,
          color: Colors.grey,
          size: iconSize,
        ),
      );
    }

    return IconButton(
        onPressed: player.reset,
        icon: const Icon(
          Icons.stop,
          color: primaryColor,
          size: iconSize,
        ));
  }

  Widget buildPauseButton() {
    if (state != PlayerState.PLAYING) {
      return const IconButton(
        onPressed: null,
        icon: Icon(
          Icons.pause,
          color: Colors.grey,
          size: iconSize,
        ),
      );
    }

    return IconButton(
        onPressed: player.pause,
        icon: const Icon(
          Icons.pause,
          color: primaryColor,
          size: iconSize,
        ));
  }
}

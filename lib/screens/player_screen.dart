import 'package:flutter/material.dart';
import 'package:kin/constants/constants.dart';
import 'package:kin/models/sermon_model.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicPlayer extends StatefulWidget {
  final SermonModel sermon;
  const MusicPlayer({required this.sermon, Key? key}) : super(key: key);

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  AudioPlayer? audioPlayer;

  bool isPlaying = false;
  bool isPaused = false;

  Duration duration = const Duration();
  Duration position = const Duration();

  @override
  void initState() {
    super.initState();

    audioPlayer = AudioPlayer();
    // Get Duration

    audioPlayer!.onDurationChanged.listen((d) {
      setState(() {
        duration = d;
      });
    });
    //Get Position
    audioPlayer!.onAudioPositionChanged.listen((p) {
      setState(() {
        position = p;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kdark.withOpacity(0.8),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: (() {
                  Navigator.pop(context);
                }),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    top: 12,
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    color: kGold,
                    size: 30,
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    widget.sermon.sermonName!.toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                      color: kGold,
                    ),
                  ),
                  Text(
                    widget.sermon.pastorName!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: kGold,
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      color: kGold,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 5,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.music_note,
                      size: 300,
                      color: kdark,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      slider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              position.toString().split('.')[0],
                              style: TextStyle(color: kGold, fontSize: 12),
                            ),
                            Text(
                              "- " +
                                  (duration - position)
                                      .toString()
                                      .split('.')[0],
                              style: TextStyle(color: kGold, fontSize: 12),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.skip_previous,
                          color: kGold,
                        ),
                        iconSize: 75,
                        onPressed: () {},
                      ),
                      IconButton(
                        splashColor: kGold.withOpacity(0.7),
                        icon: isPlaying == false
                            ? const Icon(Icons.play_arrow)
                            : const Icon(Icons.pause),
                        color: kGold,
                        iconSize: 100,
                        onPressed: (() {
                          if (isPlaying == false) {
                            audioPlayer!.play(widget.sermon.audioUrl!);
                            setState(() {
                              isPlaying = true;
                            });
                          } else {
                            setState(() {
                              isPlaying = false;
                            });
                            audioPlayer!.pause();
                          }
                        }),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.skip_next,
                          color: kGold,
                        ),
                        iconSize: 75,
                        highlightColor: Colors.transparent,
                        splashColor: kGold.withOpacity(0.7),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget slider() {
    return Slider(
      value: position.inSeconds.toDouble(),
      max: duration.inSeconds.toDouble(),
      min: 0.0,
      thumbColor: kGold,
      activeColor: kGold,
      inactiveColor: Colors.grey.shade800,
      onChanged: (double value) {
        setState(() {
          Duration newDuration = Duration(seconds: value.toInt());
          audioPlayer!.seek(newDuration);
          value = value;
        });
      },
    );
  }
}

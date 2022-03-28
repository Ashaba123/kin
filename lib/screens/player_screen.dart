import 'package:flutter/material.dart';
import 'package:kin/constants/constants.dart';
import 'package:kin/models/sermon_model.dart';

class MusicPlayer extends StatefulWidget {
  final SermonModel sermon;
  const MusicPlayer({required this.sermon, Key? key}) : super(key: key);

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
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
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.skip_previous,
                          color: kGold,
                          size: 60,
                        ),
                        Icon(
                          Icons.play_arrow,
                          color: kGold,
                          size: 60,
                        ),
                        Icon(
                          Icons.skip_next,
                          color: kGold,
                          size: 60,
                        ),
                       
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

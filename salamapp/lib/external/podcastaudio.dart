import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salamapp/theme/colors.dart';

class PodCastAudio extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables, non_constant_identifier_names
  final PodData;

  // ignore: non_constant_identifier_names
  final String PodPath;

  final int index;
  // ignore: non_constant_identifier_names
  const PodCastAudio({
    Key? key,
    required this.index,
    // ignore: non_constant_identifier_names
    required this.PodData,
    // ignore: non_constant_identifier_names
    required this.PodPath,
  }) : super(key: key);

  @override
  State<PodCastAudio> createState() => _PodCastAudioState();
}

class _PodCastAudioState extends State<PodCastAudio>
    with TickerProviderStateMixin {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  late Source path;
  // ignore: prefer_typing_uninitialized_variables
  var index;

  @override
  void initState() {
    super.initState();

    setAudio();

    _readPodcast();

    // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
    audioPlayer.onPlayerStateChanged.listen((State) {
      setState(() {
        isPlaying = State == PlayerState.playing;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });

    audioPlayer.onPlayerComplete.listen((playingStop) {
      setState(() {
        position = const Duration(seconds: 0);
        isPlaying = false;
      });
    });

    path = UrlSource(widget.PodPath);
  }

  Future setAudio() async {}

  // ignore: non_constant_identifier_names
  List Podcastlist = [];

  _readPodcast() async {
    await DefaultAssetBundle.of(context)
        .loadString("assets/podcast_json/Podcast.json")
        .then((s) {
      setState(() {
        Podcastlist = json.decode(s);
      });
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var siZe = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Zwhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Zwhite,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_rounded,
            color: Zred,
          ),
        ),
        title: Text(
          'Podcast',
          style: TextStyle(
            fontSize: 20,
            color: Zblack.withOpacity(0.5),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: siZe.height * 0.5,
              width: siZe.width * 0.95,
              alignment: Alignment.center,
              child: Icon(
                Icons.mic_rounded,
                color: Zblack.withOpacity(0.3),
                size: 250,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.warning_amber_rounded,
                    color: Zred,
                    size: 18,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "Stay Connected to Network",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Zblack.withOpacity(0.3),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 50),
            Text(
              widget.PodData[widget.index]['heading'],
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Zblack,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              widget.PodData[widget.index]['subheading'],
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Zblack.withOpacity(0.4),
              ),
            ),
            const SizedBox(height: 10),
            SliderTheme(
              data: const SliderThemeData(
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 18),
                trackHeight: 2.5,
                thumbColor: Zred,
              ),
              child: Slider(
                min: 0,
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds.toDouble(),
                activeColor: Zred,
                inactiveColor: Zblack.withOpacity(0.09),
                onChanged: (value) async {
                  final position = Duration(seconds: value.toInt());
                  await audioPlayer.seek(position);

                  await audioPlayer.resume();
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 0.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    formatTime(position),
                    style: TextStyle(
                      color: Zblack.withOpacity(0.4),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    formatTime(duration - position),
                    style: TextStyle(
                      color: Zblack.withOpacity(0.4),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    audioPlayer.setPlaybackRate(0.5);
                  },
                  child: SvgPicture.asset(
                    'assets/icons/backward.svg',
                    color: Zred,
                    height: 21,
                    width: 21,
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(40),
                  onTap: () async {
                    if (isPlaying) {
                      await audioPlayer.pause();
                    } else {
                      await audioPlayer.play(path);
                    }
                  },
                  child: CircleAvatar(
                    backgroundColor: Zgrey,
                    radius: 40,
                    child: SvgPicture.asset(
                      isPlaying
                          ? 'assets/icons/play.svg'
                          : 'assets/icons/pause.svg',
                      height: 22,
                      width: 22,
                      fit: BoxFit.cover,
                      color: Zred,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    audioPlayer.setPlaybackRate(1.5);
                  },
                  child: SvgPicture.asset(
                    'assets/icons/forward.svg',
                    color: Zred,
                    height: 21,
                    width: 21,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

String formatTime(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  final hours = twoDigits(duration.inHours);
  final minutes = twoDigits(duration.inMinutes.remainder(60));
  final seconds = twoDigits(duration.inSeconds.remainder(60));

  return [if (duration.inHours > 0) hours, minutes, seconds].join(':');
}

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';
import 'package:salamapp/interface/bottomnav.dart';
import 'package:salamapp/provider%20like/fav_provider.dart';
import 'package:salamapp/theme/colors.dart';

class QuranAudio extends StatefulWidget {
  final audioData;
  final int Index;
  const QuranAudio({
    Key? key,
    this.audioData,
    required this.Index,
  }) : super(key: key);

  @override
  State<QuranAudio> createState() => _QuranAudioState();
}

class _QuranAudioState extends State<QuranAudio> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  bool isRepeat = false;
  Color color = Color(0xFF9A16F2).withOpacity(0.5);

  @override
  void initState() {
    super.initState();

    setAudio();

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
        position = Duration(seconds: 0);
        isPlaying = false;
        isRepeat = false;
      });
    });
  }

  Future setAudio() async {
    //audioPlayer.setReleaseMode(ReleaseMode.loop);

    final player = AudioCache(prefix: 'assets/audio');
    final url = await player.load('001.mp3');
    //audioPlayer.setUrl(url.path, isLocal: true);
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);

    return Scaffold(
      backgroundColor: Kblack,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Kblack,
        leading: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BottomNav()),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SvgPicture.asset(
              'assets/icons/back.svg',
              color: Kred,
              height: 18,
              width: 18,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        title: Text(
          "Surah",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: Kred,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.share_rounded,
              color: Kred,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
              child: Container(
                height: 350,
                width: 350,
                decoration: BoxDecoration(
                  color: Kwhite.withOpacity(0.02),
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage('assets/images/quran4.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Al Fatiha\n",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: Kred,
                      ),
                    ),
                    TextSpan(
                      text: "Ali Al Hudhaifhi",
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Kwhite.withOpacity(0.3),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SliderTheme(
              data: SliderThemeData(
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 18),
                trackHeight: 1.5,
                thumbColor: Kred.withOpacity(0.4),
              ),
              child: Slider(
                min: 0,
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds.toDouble(),
                activeColor: Kred,
                inactiveColor: Kwhite.withOpacity(0.08),
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
                    style: TextStyle(color: Kred, fontSize: 12),
                  ),
                  Text(
                    formatTime(duration - position),
                    style: TextStyle(color: Kred, fontSize: 12),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      if (isRepeat == false) {
                        audioPlayer.setReleaseMode(ReleaseMode.loop);
                        setState(() {
                          isRepeat = true;
                          color = Color(0xFF9A16F2);
                        });
                      } else if (isRepeat == true) {
                        audioPlayer.setReleaseMode(ReleaseMode.release);
                        color = Color(0xFF9A16F2).withOpacity(0.5);
                      }
                    },
                    child: SvgPicture.asset(
                      'assets/icons/loop.svg',
                      height: 18,
                      width: 18,
                      color: color,
                    ),
                  ),
                  LikeButton(
                    size: 20,
                    bubblesColor: BubblesColor(
                        dotPrimaryColor: Kred, dotSecondaryColor: Kwhite),
                    likeBuilder: (isLiked) {
                      if (isLiked)
                        return SvgPicture.asset(
                          'assets/icons/heartr.svg',
                          height: 18,
                          width: 18,
                          color: Kred,
                        );
                      if (!isLiked) {
                        return SvgPicture.asset(
                          'assets/icons/heartout.svg',
                          height: 18,
                          width: 18,
                          color: Kred,
                        );
                      }
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    'assets/icons/shuffle.svg',
                    height: 18,
                    width: 18,
                    color: Kred,
                  ),
                  SvgPicture.asset(
                    'assets/icons/device.svg',
                    height: 18,
                    width: 18,
                    color: Kred,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      audioPlayer.setPlaybackRate(0.5);
                    },
                    child: SvgPicture.asset(
                      'assets/icons/backward.svg',
                      color: Kred,
                      height: 18,
                      width: 18,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      if (isPlaying) {
                        await audioPlayer.pause();
                      } else {
                        await audioPlayer.play(AssetSource('audio/001.mp3'));
                      }
                    },
                    child: CircleAvatar(
                      backgroundColor: Kwhite.withOpacity(0.02),
                      radius: 30,
                      child: SvgPicture.asset(
                        isPlaying
                            ? 'assets/icons/play.svg'
                            : 'assets/icons/pause.svg',
                        height: 18,
                        width: 18,
                        fit: BoxFit.cover,
                        color: Kred,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      audioPlayer.setPlaybackRate(1.5);
                    },
                    child: SvgPicture.asset(
                      'assets/icons/forward.svg',
                      color: Kred,
                      height: 18,
                      width: 18,
                    ),
                  ),
                ],
              ),
            )
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

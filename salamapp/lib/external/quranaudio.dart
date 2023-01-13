import 'package:app_settings/app_settings.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';
import 'package:salamapp/interface/bottomnav.dart';
import 'package:salamapp/provider%20like/fav_provider.dart';
import 'package:salamapp/theme/colors.dart';
import 'package:quran/quran.dart' as quran;
import 'package:shared_preferences/shared_preferences.dart';

class QuranAudio extends StatefulWidget {
  final String audioPaths;
  final int surahnumber;
  const QuranAudio({
    Key? key,
    required this.surahnumber,
    required this.audioPaths,
  }) : super(key: key);

  @override
  State<QuranAudio> createState() => _QuranAudioState();
}

class _QuranAudioState extends State<QuranAudio>
    with SingleTickerProviderStateMixin {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  bool isRepeat = false;
  Color color = Color(0xFFFF315B).withOpacity(0.5);
  late Source path;
  static const LikedKey = 'Liked_Key';
  late bool Liked = false;

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

    path = UrlSource(this.widget.audioPaths);

    _restorePersistedPreference();
  }

  void _restorePersistedPreference() async {
    var preferences = await SharedPreferences.getInstance();
    var Liked = preferences.getBool(LikedKey);
    setState(() => this.Liked = Liked!);
  }

  void _persistPreference() async {
    setState(() => Liked = !Liked);
    var preferences = await SharedPreferences.getInstance();
    preferences.setBool(LikedKey, Liked);
  }

  Future setAudio() async {
    //audioPlayer.setReleaseMode(ReleaseMode.loop);

    //audioPlayer.setSourceUrl(path);
    //final player = AudioCache(prefix: 'assets/audio');
    //final url = await player.load('001.mp3');
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
            audioPlayer.stop();
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
            fontWeight: FontWeight.w500,
            color: Kwhite.withOpacity(0.3),
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
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                child: Container(
                  height: 350,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Kwhite.withOpacity(0.02),
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
                        text: quran.getSurahName(widget.surahnumber),
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: Kwhite,
                        ),
                      ),
                      TextSpan(
                        text: "\nAli Al Hudhaifhi",
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        if (isRepeat == false) {
                          audioPlayer.setReleaseMode(ReleaseMode.loop);
                          setState(() {
                            isRepeat = true;
                            color = Color(0xFFFF315B);
                          });
                        } else if (isRepeat == true) {
                          audioPlayer.setReleaseMode(ReleaseMode.release);
                          color = Color(0xFFFF315B).withOpacity(0.5);
                        }
                      },
                      child: SvgPicture.asset(
                        'assets/icons/loop.svg',
                        height: 18,
                        width: 18,
                        color: color,
                      ),
                    ),
                    InkWell(
                      onTap: _persistPreference,
                      child: LikeButton(
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
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(
                        'assets/icons/shuffle.svg',
                        height: 18,
                        width: 18,
                        color: Kred,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        AppSettings.openBluetoothSettings();
                      },
                      child: SvgPicture.asset(
                        'assets/icons/device.svg',
                        height: 18,
                        width: 18,
                        color: Kred,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 70, vertical: 4),
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
                          await audioPlayer.play(path);
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
              ),
              SizedBox(height: 21),
              Container(
                height: 40,
                width: 380,
                decoration: BoxDecoration(
                  color: Kwhite.withOpacity(0.05),
                ),
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: "Listen to ",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Kred,
                      ),
                    ),
                    TextSpan(
                      text: quran.getSurahName(widget.surahnumber),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Kred,
                      ),
                    )
                  ]),
                ),
              ),
              SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: quran.getVerseCount(widget.surahnumber),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      quran.getVerse(widget.surahnumber, index + 1,
                          verseEndSymbol: true),
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Kwhite,
                        fontSize: 20,
                      ),
                    ),
                  );
                },
              )
            ],
          ),
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

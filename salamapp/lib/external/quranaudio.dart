import 'package:app_settings/app_settings.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';
import 'package:salamapp/interface/bottomnav.dart';
import 'package:salamapp/provider%20like/fav_provider.dart';
import 'package:salamapp/quran%20data/quran.dart';
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
  Color color = const Color(0xFFFF315B).withOpacity(0.5);
  late Source path;
  // ignore: constant_identifier_names
  static const LikedKey = 'Liked_Key';
  // ignore: non_constant_identifier_names
  late bool Liked = false;

  @override
  void initState() {
    super.initState();

    setAudio();

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
        isRepeat = false;
      });
    });

    // ignore: unnecessary_this
    path = UrlSource(this.widget.audioPaths);

    _restorePersistedPreference();
  }

  void _restorePersistedPreference() async {
    var preferences = await SharedPreferences.getInstance();
    // ignore: non_constant_identifier_names
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
    // ignore: unused_local_variable
    final provider = Provider.of<FavoriteProvider>(context);

    var siZe = MediaQuery.of(context).size;

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
              MaterialPageRoute(builder: (context) => const BottomNav()),
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
            onPressed: () {
              showModalBottomSheet(
                  backgroundColor: Kblack,
                  context: context,
                  builder: (context) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: const Text(
                            "Name of the Surah",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Kred,
                            ),
                          ),
                          title: Text(
                            quran.getSurahName(widget.surahnumber),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Kwhite.withOpacity(0.3),
                            ),
                          ),
                        ),
                        ListTile(
                          leading: const Text(
                            "Place of revelation",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Kred,
                            ),
                          ),
                          title: Text(
                            quran.getPlaceOfRevelation(widget.surahnumber),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Kwhite.withOpacity(0.3),
                            ),
                          ),
                        ),
                        ListTile(
                          leading: const Text(
                            "Arabic Name",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Kred,
                            ),
                          ),
                          title: Text(
                            quran.getSurahNameArabic(widget.surahnumber),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Kwhite.withOpacity(0.3),
                            ),
                          ),
                        ),
                        ListTile(
                          leading: const Text(
                            "English Name",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Kred,
                            ),
                          ),
                          title: Text(
                            quran.getSurahNameEnglish(widget.surahnumber),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Kwhite.withOpacity(0.3),
                            ),
                          ),
                        ),
                        ListTile(
                          leading: const Text(
                            "Total verses in Quran",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Kred,
                            ),
                          ),
                          title: Text(
                            totalVerseCount.toString(),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Kwhite.withOpacity(0.3),
                            ),
                          ),
                        ),
                        ListTile(
                          leading: const Text(
                            "Total Verse count",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Kred,
                            ),
                          ),
                          title: Text(
                            quran.getVerseCount(widget.surahnumber).toString(),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Kwhite.withOpacity(0.3),
                            ),
                          ),
                        ),
                        ListTile(
                          leading: const Text(
                            "Total Juz",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Kred,
                            ),
                          ),
                          title: Text(
                            totalJuzCount.toString(),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Kwhite.withOpacity(0.3),
                            ),
                          ),
                        ),
                        ListTile(
                          leading: const Text(
                            "Name of reciter",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Kred,
                            ),
                          ),
                          title: Text(
                            "Al-Qaria Yassen",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Kwhite.withOpacity(0.3),
                            ),
                          ),
                        ),
                      ],
                    );
                  });
            },
            icon: const Icon(
              Icons.more_vert_rounded,
              color: Kred,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                child: Container(
                  height: siZe.height * 0.4,
                  width: siZe.width * 0.95,
                  decoration: BoxDecoration(
                    color: Kwhite.withOpacity(0.02),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/quran4.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.warning_amber_rounded,
                      color: Kred,
                      size: 18,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Stay Connected to Network",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Kwhite.withOpacity(0.5),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: quran.getSurahName(widget.surahnumber),
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: Kwhite,
                        ),
                      ),
                      TextSpan(
                        text: "\nAl-Qaria Yassen  ||   ",
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: Kwhite.withOpacity(0.3),
                        ),
                      ),
                      TextSpan(
                        text: quran.getPlaceOfRevelation(widget.surahnumber),
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
                  thumbShape:
                      const RoundSliderThumbShape(enabledThumbRadius: 5),
                  overlayShape:
                      const RoundSliderOverlayShape(overlayRadius: 18),
                  trackHeight: 2.5,
                  thumbColor: Kred.withOpacity(0.4),
                ),
                child: Slider(
                  min: 0,
                  max: duration.inSeconds.toDouble(),
                  value: position.inSeconds.toDouble(),
                  activeColor: Kred,
                  inactiveColor: Kwhite.withOpacity(0.1),
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
                        color: Kwhite.withOpacity(0.3),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      formatTime(duration - position),
                      style: TextStyle(
                        color: Kwhite.withOpacity(0.3),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
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
                            color = const Color(0xFFFF315B);
                          });
                        } else if (isRepeat == true) {
                          audioPlayer.setReleaseMode(ReleaseMode.release);
                          color = const Color(0xFFFF315B).withOpacity(0.5);
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
                      onTap: () {
                        audioPlayer.setPlaybackRate(0.5);
                      },
                      child: SvgPicture.asset(
                        'assets/icons/backward.svg',
                        color: Kred,
                        height: 21,
                        width: 21,
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
                        radius: 35,
                        child: SvgPicture.asset(
                          isPlaying
                              ? 'assets/icons/play.svg'
                              : 'assets/icons/pause.svg',
                          height: 21,
                          width: 21,
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
                        height: 21,
                        width: 21,
                      ),
                    ),
                    InkWell(
                      onTap: _persistPreference,
                      child: LikeButton(
                        size: 20,
                        // ignore: non_constant_identifier_names, body_might_complete_normally_nullable
                        likeBuilder: (Liked) {
                          if (Liked) {
                            return SvgPicture.asset(
                              'assets/icons/heartr.svg',
                              height: 18,
                              width: 18,
                              color: Kred,
                            );
                          }
                          if (!Liked) {
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
                    const SizedBox(width: 130),
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.share_outlined,
                        color: Kred,
                        size: 21,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showAlertDialog(context);
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
              const SizedBox(height: 50),
              Container(
                height: siZe.height * 0.06,
                width: siZe.width * 0.95,
                decoration: BoxDecoration(
                  color: Kwhite.withOpacity(0.05),
                ),
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Container(
                      height: siZe.height * 0.05,
                      width: siZe.width * 0.01,
                      decoration: BoxDecoration(
                        color: Kwhite,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    const SizedBox(width: 15),
                    RichText(
                      text: TextSpan(children: [
                        const TextSpan(
                          text: "Listen to ",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Kred,
                          ),
                        ),
                        TextSpan(
                          text: quran.getSurahName(widget.surahnumber),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Kred,
                          ),
                        )
                      ]),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: quran.getVerseCount(widget.surahnumber),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      quran.getVerse(widget.surahnumber, index + 1,
                          verseEndSymbol: true),
                      textAlign: TextAlign.right,
                      style: const TextStyle(
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

showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: const Text(
      "Cancel",
      style: TextStyle(color: Kred),
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  Widget continueButton = TextButton(
    child: const Text(
      "Continue",
      style: TextStyle(color: Kwhite),
    ),
    onPressed: () {
      AppSettings.openBluetoothSettings();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    backgroundColor: Kblack,
    title: Row(
      children: const [
        Icon(
          Icons.mic_outlined,
          color: Kred,
          size: 20,
        ),
        SizedBox(width: 5),
        Text(
          "Hear the blessing",
          style: TextStyle(color: Kwhite),
        ),
      ],
    ),
    content: Text(
        "Immerse and experience the beautiful recitation of quran in HD voice of Al-Qaria Yassen",
        style: TextStyle(color: Kwhite.withOpacity(0.5))),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

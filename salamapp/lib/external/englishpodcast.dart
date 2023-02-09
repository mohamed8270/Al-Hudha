import 'package:flutter/material.dart';
import 'package:salamapp/external/podcastaudio.dart';
import 'package:salamapp/theme/colors.dart';

class EnglishPodcast extends StatelessWidget {
  const EnglishPodcast({
    Key? key,
    // ignore: non_constant_identifier_names
    required this.Podcastlist,
    required this.siZe,
  }) : super(key: key);

  // ignore: non_constant_identifier_names
  final List Podcastlist;
  final Size siZe;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Podcastlist.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemBuilder: ((context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PodCastAudio(
                    index: index,
                    PodData: Podcastlist,
                    PodPath: Podcastlist[index + 0]['PodLink'],
                  ),
                ),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: siZe.width * 0.2,
                  height: siZe.height * 0.1,
                  alignment: Alignment.topCenter,
                  child: Icon(
                    Icons.mic_rounded,
                    color: Zblack.withOpacity(0.1),
                    size: 44,
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 250,
                      child: Text(
                        Podcastlist[index]["heading"],
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Zblack,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      Podcastlist[index]["subheading"],
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Zblack.withOpacity(0.4),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

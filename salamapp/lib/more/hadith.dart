import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:salamapp/external/hadith_models.dart';
import 'package:salamapp/theme/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class HadithSalam extends StatefulWidget {
  final String urlPath;

  const HadithSalam({
    Key? key,
    required this.urlPath,
  }) : super(key: key);

  @override
  State<HadithSalam> createState() => _HadithSalamState();
}

class _HadithSalamState extends State<HadithSalam> {
  late Source urlPath;
  late int index;

  @override
  Widget build(BuildContext context) {
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
          'Hadiths',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Zblack.withOpacity(0.5),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 0, left: 10, right: 10),
        child: ListView.builder(
          itemCount: HadithTopic.length,
          itemBuilder: (context, i) => Column(
            children: [
              InkWell(
                // ignore: deprecated_member_use, unnecessary_this
                onTap: () => launch(this.widget.urlPath),
                child: ListTile(
                  title: Text(
                    HadithTopic[i].name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Zblack,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

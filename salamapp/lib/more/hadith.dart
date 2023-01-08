import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salamapp/external/hadith_models.dart';
import 'package:salamapp/theme/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class HadithSalam extends StatefulWidget {
  const HadithSalam({
    Key? key,
  }) : super(key: key);

  @override
  State<HadithSalam> createState() => _HadithSalamState();
}

class _HadithSalamState extends State<HadithSalam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kblack,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Kblack,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SvgPicture.asset(
              'assets/icons/back.svg',
              height: 18,
              width: 18,
              color: Kred,
            ),
          ),
        ),
        title: Text(
          'Hadiths',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Kwhite.withOpacity(0.3),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: HadithTopic.length,
          itemBuilder: (context, i) => Column(
            children: [
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: new Text(
                    HadithTopic[i].name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Kwhite,
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

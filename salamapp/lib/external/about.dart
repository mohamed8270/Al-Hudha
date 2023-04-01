import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:salamapp/theme/colors.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    var siZe = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Zwhite,
      appBar: AppBar(
        backgroundColor: Zwhite,
        elevation: 0,
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
          'About the app',
          style: TextStyle(
            fontSize: 20,
            color: Zblack.withOpacity(0.5),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "Asalamu Alaikum Wa Rahmathullahi Wa Barakathuhu,",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Zblack,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: siZe.width * 0.95,
                constraints: const BoxConstraints(maxHeight: double.infinity),
                decoration: BoxDecoration(
                  color: Zblack.withOpacity(0.03),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Al Hudha?",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Zred,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Al Hudha represents another name of the Quran which gives the meaning of 'The Guidance'. The slogan of Al Hudha is 'Seek Knowledge' hence the full representation bridges as 'Get the guidance of Allah through seeking knowledge'. Al Hudha is an Islamic app that consists of various functions such as other Islamic apps but the main advantage of using Al Hudha is that it does not contain any third-party advertisements so that the user can have a clear mind on reading the Quran and listening to it in the Al Hudha.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Zblack.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: siZe.width * 0.95,
                constraints: const BoxConstraints(maxHeight: double.infinity),
                decoration: BoxDecoration(
                  color: Zblack.withOpacity(0.03),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Objective and Goal",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Zred,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "There are various elements that help the user to make him/her more Muslim and connect the user to Allah. Make remembrance of Allah in each and every aspect. Such things are the Prayer timing, Qibla direction, Tasbih calculator, Hadid, Use and Benefits of Surah, Zakat calculator, etc",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Zblack.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: siZe.width * 0.95,
                constraints: const BoxConstraints(maxHeight: double.infinity),
                decoration: BoxDecoration(
                  color: Zblack.withOpacity(0.03),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Feedback",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Zred,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "We request the user to make use of Al Hudha in a well-conscious manner and not spread any wrong information about the use and benefits of Surah, Have a clear conversation about the whole statement with Aalim or Hafil before giving dawah to others. If the app contains any issues or if there are any suggestions users can send feedback about it",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Zblack.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

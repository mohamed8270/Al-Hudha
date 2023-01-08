import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salamapp/theme/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class CharityPage extends StatefulWidget {
  const CharityPage({Key? key}) : super(key: key);

  @override
  State<CharityPage> createState() => _CharityPageState();
}

class _CharityPageState extends State<CharityPage> {
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
          'Charity & Donation',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Kwhite.withOpacity(0.3),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
        child: Column(
          children: [
            Container(
              height: 110,
              width: 380,
              decoration: BoxDecoration(
                color: Kwhite.withOpacity(0.03),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.warning_amber_rounded,
                          color: Kred.withOpacity(0.7),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Attention!",
                          style: TextStyle(
                            fontSize: 18,
                            color: Kwhite,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 5),
                    Text(
                      "The donation site below mentioned is fully trusted and reviewed by the developer, There is no malisious activities or scamming in the mentioned platform",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Kwhite.withOpacity(0.5),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 200,
              width: 380,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Kwhite.withOpacity(0.03),
                image: DecorationImage(
                  image: AssetImage('assets/images/heart.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/donate.svg',
                          height: 18,
                          width: 18,
                          color: Kred,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Quran about charity',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Kblack,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Those who spend their wealth in \nAllah's cause are like grains of corn\nwhich produce seven ears, each\nbearing a hundred grains",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Kblack,
                      ),
                    ),
                    SizedBox(height: 15),
                    InkWell(
                      onTap: () => launch(
                          'https://www.savejan.com/donationpage?utm_content=13964962&utm_medium=Email&utm_name=Id&utm_source=Actionetics&utm_term=Email'),
                      child: Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Kred,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Donate Now",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Kwhite,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

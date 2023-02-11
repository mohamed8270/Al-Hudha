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
          'Charity & Donation',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Zblack.withOpacity(0.5),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
        child: Column(
          children: [
            Container(
              height: siZe.height * 0.14,
              width: siZe.width * 0.95,
              decoration: BoxDecoration(
                color: Zgrey,
                borderRadius: BorderRadius.circular(10),
              ),
              clipBehavior: Clip.hardEdge,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.warning_amber_rounded,
                          color: Zred,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Attention!",
                          style: TextStyle(
                            fontSize: 18,
                            color: Zblack,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "The donation site below mentioned is fully trusted and reviewed by the developer, There is no malisious activities or scamming in the mentioned platform",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Zblack.withOpacity(0.3),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: siZe.height * 0.28,
              width: siZe.width * 0.95,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Zgrey,
                image: const DecorationImage(
                  image: AssetImage('assets/images/heart.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              clipBehavior: Clip.hardEdge,
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
                          color: Zred,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Quran about charity',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Zblack,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Those who spend their wealth in \nAllah's cause are like grains of corn\nwhich produce seven ears, each\nbearing a hundred grains",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Zblack.withOpacity(0.6),
                      ),
                    ),
                    const SizedBox(height: 15),
                    InkWell(
                      // ignore: deprecated_member_use
                      onTap: () => launch(
                          'https://www.savejan.com/donationpage?utm_content=13964962&utm_medium=Email&utm_name=Id&utm_source=Actionetics&utm_term=Email'),
                      child: Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Zred,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "Donate Now",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Zwhite,
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

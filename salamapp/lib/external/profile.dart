// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:salamapp/external/bookmark.dart';
import 'package:salamapp/hijri%20calendar/hijri.dart';
import 'package:salamapp/more/charity.dart';
import 'package:salamapp/notification/notification.dart';
import 'package:salamapp/policy/privacy.dart';
import 'package:salamapp/security/security.dart';
import 'package:salamapp/theme/colors.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
          "Profile",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Zblack.withOpacity(0.5),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, right: 10, left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundColor: Zgrey,
                  child: ClipOval(
                    child: Image.network(
                      FirebaseAuth.instance.currentUser!.photoURL!,
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      FirebaseAuth.instance.currentUser!.displayName!,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Zblack,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      FirebaseAuth.instance.currentUser!.email!,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Zblack.withOpacity(0.4),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 50),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BookMarks(),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const ProfileCard(
                    icn: Icons.bookmark_outline_rounded,
                    txt: 'Bookmarks',
                  ),
                  Icon(
                    Icons.keyboard_arrow_right_outlined,
                    color: Zblack.withOpacity(0.2),
                    size: 30,
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HijriCalendar(),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const ProfileCard(
                    icn: Icons.calendar_month_outlined,
                    txt: 'Hijir Calendar',
                  ),
                  Icon(
                    Icons.keyboard_arrow_right_outlined,
                    color: Zblack.withOpacity(0.2),
                    size: 30,
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CharityPage(),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const ProfileCard(
                    icn: Icons.attach_money_outlined,
                    txt: 'Charity Donation',
                  ),
                  Icon(
                    Icons.keyboard_arrow_right_outlined,
                    color: Zblack.withOpacity(0.2),
                    size: 30,
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificationSalam(),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const ProfileCard(
                    icn: Icons.notifications_on_outlined,
                    txt: 'Notification',
                  ),
                  Icon(
                    Icons.keyboard_arrow_right_outlined,
                    color: Zblack.withOpacity(0.2),
                    size: 30,
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PrivacyPolicyScreen(),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const ProfileCard(
                    icn: Icons.privacy_tip_outlined,
                    txt: 'Privacy Policy',
                  ),
                  Icon(
                    Icons.keyboard_arrow_right_outlined,
                    color: Zblack.withOpacity(0.2),
                    size: 30,
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SecurityScreen(),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const ProfileCard(
                    icn: Icons.security_outlined,
                    txt: 'Security & Safety',
                  ),
                  Icon(
                    Icons.keyboard_arrow_right_outlined,
                    color: Zblack.withOpacity(0.2),
                    size: 30,
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const ProfileCard(
                    icn: Icons.info_outline_rounded,
                    txt: 'About',
                  ),
                  Icon(
                    Icons.keyboard_arrow_right_outlined,
                    color: Zblack.withOpacity(0.2),
                    size: 30,
                  )
                ],
              ),
            ),
            FlatButton(
              minWidth: 140,
              height: 40,
              onPressed: () {},
              shape: const StadiumBorder(),
              color: Zred,
              child: const Text(
                "Sign Out",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Zwhite,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String txt;
  final IconData icn;
  const ProfileCard({
    Key? key,
    required this.txt,
    required this.icn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icn,
            color: Zred,
          ),
          const SizedBox(width: 30),
          Text(
            txt,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Zblack,
            ),
          ),
        ],
      ),
    );
  }
}

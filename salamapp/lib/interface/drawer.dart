import 'dart:convert';
import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:salamapp/external/bookmark.dart';
import 'package:salamapp/external/hadith_models.dart';
import 'package:salamapp/hijri%20calendar/hijri.dart';
import 'package:salamapp/more/charity.dart';
import 'package:salamapp/more/hadith.dart';
import 'package:salamapp/policy/privacy.dart';
import 'package:salamapp/screens/quran.dart';
import 'package:salamapp/security/security.dart';
import 'package:salamapp/theme/colors.dart';

class DrawerSalam extends StatefulWidget {
  const DrawerSalam({Key? key}) : super(key: key);

  @override
  State<DrawerSalam> createState() => _DrawerSalamState();
}

class _DrawerSalamState extends State<DrawerSalam>
    with SingleTickerProviderStateMixin {
  List HadidList = [];

  @override
  initState() {
    super.initState();
    _readData();
  }

  _readData() async {
    await DefaultAssetBundle.of(context)
        .loadString("assets/hadid_json/Hadid.json")
        .then((s) {
      setState(() {
        HadidList = json.decode(s);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Kblack,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              FirebaseAuth.instance.currentUser!.displayName!,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Kwhite,
              ),
            ),
            accountEmail: Text(
              FirebaseAuth.instance.currentUser!.email!,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Kwhite.withOpacity(0.5),
              ),
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                  child: Image.network(
                FirebaseAuth.instance.currentUser!.photoURL!,
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              )),
            ),
            decoration: BoxDecoration(color: Kblack),
          ),
          ListTile(
            leading: Icon(
              Icons.bookmark_outline_rounded,
              color: Kwhite,
            ),
            title: Text(
              'Bookmarks',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Kred,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookMarks(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.calendar_month_outlined,
              color: Kwhite,
            ),
            title: Text(
              'Calendar',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Kred,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HijriCalendar(),
                ),
              );
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              'assets/icons/donate.svg',
              height: 17,
              width: 17,
              color: Kwhite,
            ),
            title: Text(
              'Charity Donation',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Kred,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CharityPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.security_outlined,
              color: Kwhite,
            ),
            title: Text(
              'Security',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Kred,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecurityScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.privacy_tip_outlined,
              color: Kwhite,
            ),
            title: Text(
              'Privacy Policy',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Kred,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PrivacyPolicyScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

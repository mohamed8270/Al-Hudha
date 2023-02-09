import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salamapp/external/bookmark.dart';
import 'package:salamapp/hijri%20calendar/hijri.dart';
import 'package:salamapp/more/charity.dart';
import 'package:salamapp/policy/privacy.dart';
import 'package:salamapp/security/security.dart';
import 'package:salamapp/theme/colors.dart';

class DrawerSalam extends StatefulWidget {
  const DrawerSalam({Key? key}) : super(key: key);

  @override
  State<DrawerSalam> createState() => _DrawerSalamState();
}

class _DrawerSalamState extends State<DrawerSalam>
    with SingleTickerProviderStateMixin {
  // ignore: non_constant_identifier_names
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
      backgroundColor: Zwhite,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              FirebaseAuth.instance.currentUser!.displayName!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Zblack,
              ),
            ),
            accountEmail: Text(
              FirebaseAuth.instance.currentUser!.email!,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Zblack.withOpacity(0.3),
              ),
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  FirebaseAuth.instance.currentUser!.photoURL!,
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: const BoxDecoration(color: Zwhite),
          ),
          ListTile(
            leading: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Zgrey,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: const Icon(
                Icons.bookmark_outline_rounded,
                color: Zblack,
              ),
            ),
            title: const Text(
              'Bookmarks',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Zred,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BookMarks(),
                ),
              );
            },
          ),
          ListTile(
            leading: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Zgrey,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: const Icon(
                Icons.calendar_month_outlined,
                color: Zblack,
              ),
            ),
            title: const Text(
              'Calendar',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Zred,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HijriCalendar(),
                ),
              );
            },
          ),
          ListTile(
            leading: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Zgrey,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: SvgPicture.asset(
                'assets/icons/donate.svg',
                height: 17,
                width: 17,
                color: Zblack,
              ),
            ),
            title: const Text(
              'Charity Donation',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Zred,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CharityPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Zgrey,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: const Icon(
                Icons.security_outlined,
                color: Zblack,
              ),
            ),
            title: const Text(
              'Security',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Zred,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SecurityScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Zgrey,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: const Icon(
                Icons.privacy_tip_outlined,
                color: Zblack,
              ),
            ),
            title: const Text(
              'Privacy Policy',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Zred,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PrivacyPolicyScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salamapp/external/hadith_models.dart';
import 'package:salamapp/more/charity.dart';
import 'package:salamapp/more/hadith.dart';
import 'package:salamapp/screens/quran.dart';
import 'package:salamapp/theme/colors.dart';

class DrawerSalam extends StatefulWidget {
  const DrawerSalam({Key? key}) : super(key: key);

  @override
  State<DrawerSalam> createState() => _DrawerSalamState();
}

class _DrawerSalamState extends State<DrawerSalam> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Kblack,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              'Mohamed Ibrahim',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Kwhite,
              ),
            ),
            accountEmail: Text(
              'ibrahimrasith@gmail.com',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Kwhite.withOpacity(0.5),
              ),
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'assets/images/mecca1.jpg',
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(color: Kblack),
          ),
          ListTile(
            leading: SvgPicture.asset(
              'assets/icons/bookout.svg',
              color: Kwhite,
              height: 22,
              width: 22,
            ),
            title: Text(
              'Quran Recitation',
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
                  builder: (context) => Quran(),
                ),
              );
            },
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
                  builder: (context) => Quran(),
                ),
              );
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              'assets/icons/hadid.svg',
              height: 17,
              width: 17,
              color: Kwhite,
            ),
            title: Text(
              'Hadiths',
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
                  builder: (context) => HadithSalam(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.location_on_outlined,
              color: Kwhite,
            ),
            title: Text(
              'Address',
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
                  builder: (context) => Quran(),
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
        ],
      ),
    );
  }
}

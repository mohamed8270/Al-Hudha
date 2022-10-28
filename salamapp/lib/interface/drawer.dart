import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
      backgroundColor: KLWhite,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              'Mohamed Ibrahim',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: KBlack,
              ),
            ),
            accountEmail: Text(
              'ibrahimrasith@gmail.com',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: KBlack.withOpacity(0.5),
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
            decoration: BoxDecoration(color: KLWhite),
          ),
          ListTile(
            leading: SvgPicture.asset(
              'assets/icons/bookout.svg',
              color: KPrimaryblue,
            ),
            title: Text(
              'Quran Recitation',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: KBlack,
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
        ],
      ),
    );
  }
}

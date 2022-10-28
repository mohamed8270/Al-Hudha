import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salamapp/screens/home.dart';
import 'package:salamapp/screens/more.dart';
import 'package:salamapp/screens/quran.dart';
import 'package:salamapp/screens/time.dart';
import 'package:salamapp/theme/colors.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 0;
  final screens = [
    Home(),
    PrayerTime(),
    Quran(),
    More(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: KPurewhite,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        iconSize: 18,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/homeout.svg',
              color: KBlack.withOpacity(0.6),
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/homefill.svg',
              color: KPrimaryblue,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/timeout.svg',
              color: KBlack.withOpacity(0.6),
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/timefill.svg',
              color: KPrimaryblue,
            ),
            label: 'Prayer Time',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/bookout.svg',
              color: KBlack.withOpacity(0.6),
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/bookfill.svg',
              color: KPrimaryblue,
            ),
            label: 'Quran',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/moreout.svg',
              color: KBlack.withOpacity(0.6),
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/morefill.svg',
              color: KPrimaryblue,
            ),
            label: 'More',
          ),
        ],
      ),
    );
  }
}

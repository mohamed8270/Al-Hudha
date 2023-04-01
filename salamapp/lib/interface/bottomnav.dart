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

class _BottomNavState extends State<BottomNav> with TickerProviderStateMixin {
  int currentIndex = 0;
  final screens = [
    const Home(),
    const PrayerTime(),
    const Quran(),
    const More(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Zwhite,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        iconSize: 18,
        currentIndex: currentIndex,
        selectedLabelStyle: const TextStyle(
          color: Zblack,
          fontSize: 12,
          fontWeight: FontWeight.w600,
          height: 1.5,
        ),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedItemColor: Zblack.withOpacity(0.3),
        selectedItemColor: Zblack,
        unselectedLabelStyle:
            TextStyle(color: Zblack.withOpacity(0.3), fontSize: 12),
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/homeout.svg',
              color: Zblack.withOpacity(0.4),
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/homeout.svg',
              color: Zred,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/timeout.svg',
              color: Zblack.withOpacity(0.4),
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/timeout.svg',
              color: Zred,
            ),
            label: 'Prayer Time',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/bookout.svg',
              color: Zblack.withOpacity(0.4),
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/bookout.svg',
              color: Zred,
            ),
            label: 'Quran',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/moreout.svg',
              color: Zblack.withOpacity(0.4),
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/moreout.svg',
              color: Zred,
            ),
            label: 'More',
          ),
        ],
      ),
    );
  }
}

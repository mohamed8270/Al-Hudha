import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salamapp/external/banner.dart';
import 'package:salamapp/interface/drawer.dart';
import 'package:salamapp/notification/notification.dart';
import '../theme/colors.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    queryData.devicePixelRatio;
    queryData.size.width;
    queryData.size.height;
    return Scaffold(
      drawer: DrawerSalam(),
      backgroundColor: KLWhite,
      appBar: AppBar(
        backgroundColor: KPurewhite,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              icon: SvgPicture.asset(
                'assets/icons/profile.svg',
                height: 20,
                width: 20,
                color: KBlack,
              ),
            );
          },
        ),
        title: Text(
          'Salam App',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationSalam()),
              );
            },
            icon: SvgPicture.asset(
              'assets/icons/notificationout.svg',
              height: 20,
              width: 20,
              color: KBlack,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                height: 200,
                width: 400,
                decoration: BoxDecoration(
                  color: KPurewhite,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage('assets/images/mufti2.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Most Popular',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: KBlack,
                    ),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: KPrimaryblue,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    BannerCards(
                      des: 'Darussalam India',
                      img: 'assets/images/yunus.jpg',
                      title: 'Prophet Yunus (PBUH)',
                    ),
                    SizedBox(width: 15),
                    BannerCards(
                      des: 'Darussalam India',
                      img: 'assets/images/musa.jpg',
                      title: 'Tales of Prophet musa',
                    ),
                    SizedBox(width: 15),
                    BannerCards(
                      des: 'Islam Media',
                      img: 'assets/images/sunnah.png',
                      title: 'Sunnahs of Prophet Mohamed',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Easy Sunnah',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: KBlack,
                    ),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: KPrimaryblue,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    BannerCards(
                      des: 'My Islam',
                      img: 'assets/images/eating.jpg',
                      title: 'Eating Sunnah',
                    ),
                    SizedBox(width: 15),
                    BannerCards(
                      des: 'Darussalam India',
                      img: 'assets/images/sleeping.jpg',
                      title: 'Sunnah of Sleeping',
                    ),
                    SizedBox(width: 15),
                    BannerCards(
                      des: 'Islam Media',
                      img: 'assets/images/sunnah.png',
                      title: 'Sunnahs of Prophet Mohamed',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:adhan/adhan.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:salamapp/external/prayertime.dart';
import 'package:salamapp/interface/bottomnav.dart';
import 'package:salamapp/theme/colors.dart';

class PrayerTime extends StatefulWidget {
  const PrayerTime({Key? key}) : super(key: key);

  @override
  State<PrayerTime> createState() => _PrayerTimeState();
}

class _PrayerTimeState extends State<PrayerTime> {
  Location location = Location();
  LocationData? _currentPosition;
  double? latitude, longitude;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kblack,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Kblack,
        leading: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BottomNav()),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SvgPicture.asset(
              'assets/icons/back.svg',
              height: 18,
              width: 18,
              fit: BoxFit.scaleDown,
              color: Kred,
            ),
          ),
        ),
        title: Text(
          'Prayer Time',
          style: TextStyle(
            fontSize: 20,
            color: Kred,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: FutureBuilder(
        future: getLoc(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Kred,
              ),
            );
          }

          final myCoordinates = Coordinates(33.769933, 72.8248431);
          final params = CalculationMethod.karachi.getParameters();
          params.madhab = Madhab.hanafi;
          final prayerTimes = PrayerTimes.today(myCoordinates, params);

          return Padding(
            padding: const EdgeInsets.only(top: 15, right: 10, left: 10),
            child: Column(
              children: [
                PrayerTimeWidget(
                  time: DateFormat.jm().format(prayerTimes.fajr),
                  title: 'Salat al-Fajr',
                ),
                Divider(
                  thickness: 1,
                  color: Kwhite.withOpacity(0.4),
                ),
                SizedBox(height: 10),
                PrayerTimeWidget(
                  time: DateFormat.jm().format(prayerTimes.dhuhr),
                  title: 'Salat al-Zuhr',
                ),
                Divider(
                  thickness: 1,
                  color: Kwhite.withOpacity(0.4),
                ),
                SizedBox(height: 10),
                PrayerTimeWidget(
                  time: DateFormat.jm().format(prayerTimes.asr),
                  title: 'Salat al-Asr',
                ),
                Divider(
                  thickness: 1,
                  color: Kwhite.withOpacity(0.4),
                ),
                SizedBox(height: 10),
                PrayerTimeWidget(
                  time: DateFormat.jm().format(prayerTimes.maghrib),
                  title: 'Salat al-Maghrib',
                ),
                Divider(
                  thickness: 1,
                  color: Kwhite.withOpacity(0.4),
                ),
                SizedBox(height: 10),
                PrayerTimeWidget(
                  time: DateFormat.jm().format(prayerTimes.isha),
                  title: 'Salat al-Isha',
                ),
                SizedBox(height: 80),
                InkWell(
                  onTap: () async {
                    await LaunchApp.openApp(
                      androidPackageName: 'com.android.clock',
                      openStore: true,
                    );
                  },
                  child: Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Kwhite.withOpacity(0.02),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/notificationout.svg',
                          height: 18,
                          width: 18,
                          fit: BoxFit.scaleDown,
                          color: Kred,
                        ),
                        SizedBox(width: 20),
                        Text(
                          'Set Reminder',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Kred,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  getLoc() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) return;
    }

    _currentPosition = await location.getLocation();
    latitude = _currentPosition!.latitude;
    longitude = _currentPosition!.longitude;
  }
}

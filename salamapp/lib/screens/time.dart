// ignore: import_of_legacy_library_into_null_safe
import 'package:adhan/adhan.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:salamapp/external/prayertime.dart';
import 'package:salamapp/interface/bottomnav.dart';
import 'package:salamapp/screens/qibla.dart';
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
    DateTime now = DateTime.now();
    var timeNow = int.parse(DateFormat('kk').format(now));
    var message = '';
    if (timeNow <= 9) {
      message = 'Did you complete fajr';
    } else if ((timeNow > 9) && (timeNow <= 12)) {
      message = 'Get ready for zuhr';
    } else if ((timeNow > 12) && (timeNow <= 15)) {
      message = 'Time for zuhr';
    } else if ((timeNow > 15) && (timeNow < 18)) {
      message = 'Time for asr';
    } else if ((timeNow >= 18) && (timeNow < 19)) {
      message = 'Time for maghrib';
    } else if ((timeNow > 19) && (timeNow <= 6)) {
      message = 'Time for Isha, Thahajjath, Fajr';
    } else {
      message = "It's time for thahajjath";
    }

    var siZe = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Zwhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Zwhite,
        leading: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BottomNav()),
            );
          },
          child: const Icon(
            Icons.arrow_back_rounded,
            color: Zred,
          ),
        ),
        title: Text(
          'Prayer Time',
          style: TextStyle(
            fontSize: 20,
            color: Zblack.withOpacity(0.5),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: FutureBuilder(
        future: getLoc(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Zred,
              ),
            );
          }

          final myCoordinates = Coordinates(10.195384, 78.394964);
          final params = CalculationMethod.karachi.getParameters();
          params.madhab = Madhab.hanafi;
          final prayerTimes = PrayerTimes.today(myCoordinates, params);

          return Padding(
            padding: const EdgeInsets.only(top: 15, right: 10, left: 10),
            child: Column(
              children: [
                Container(
                  height: siZe.height * 0.15,
                  width: siZe.width * 0.95,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Zgrey,
                    image: const DecorationImage(
                      image: AssetImage('assets/images/quran2.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 0.5),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Zred, width: 2),
                            ),
                          ),
                          child: Text(
                            message,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Zblack,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "O you who believe! Seek help in patience \nand As-Salat (the prayer). Truly! Allah \nis with As-Sabirin the patient ones",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Zblack.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                PrayerTimeWidget(
                  time: DateFormat.jm().format(prayerTimes.fajr),
                  title: 'Salat al-Fajr',
                ),
                const Divider(
                  thickness: 1,
                  color: Zgrey,
                ),
                const SizedBox(height: 10),
                PrayerTimeWidget(
                  time: DateFormat.jm().format(prayerTimes.dhuhr),
                  title: 'Salat al-Zuhr',
                ),
                const Divider(
                  thickness: 1,
                  color: Zgrey,
                ),
                const SizedBox(height: 10),
                PrayerTimeWidget(
                  time: DateFormat.jm().format(prayerTimes.asr),
                  title: 'Salat al-Asr',
                ),
                const Divider(
                  thickness: 1,
                  color: Zgrey,
                ),
                const SizedBox(height: 10),
                PrayerTimeWidget(
                  time: DateFormat.jm().format(prayerTimes.maghrib),
                  title: 'Salat al-Maghrib',
                ),
                const Divider(
                  thickness: 1,
                  color: Zgrey,
                ),
                const SizedBox(height: 10),
                PrayerTimeWidget(
                  time: DateFormat.jm().format(prayerTimes.isha),
                  title: 'Salat al-Isha',
                ),
                const Divider(
                  thickness: 1,
                  color: Zgrey,
                ),
                const SizedBox(height: 10),
                PrayerTimeWidget(
                  time: DateFormat.jm().format(prayerTimes.sunrise),
                  title: 'Sun rise',
                ),
                const SizedBox(height: 80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const QiblaDirection(),
                          ),
                        );
                      },
                      child: Container(
                        height: siZe.height * 0.065,
                        width: siZe.width * 0.35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Zgrey,
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.location_on_rounded,
                              color: Zred,
                            ),
                            SizedBox(width: 20),
                            Text(
                              "Qibla",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Zblack,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        await LaunchApp.openApp(
                          androidPackageName: 'com.android.clock',
                          openStore: true,
                        );
                      },
                      child: Container(
                        height: siZe.height * 0.065,
                        width: siZe.width * 0.5,
                        decoration: BoxDecoration(
                          color: Zgrey,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.notifications_rounded,
                              color: Zred,
                            ),
                            SizedBox(width: 20),
                            Text(
                              'Set Reminder',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Zblack,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }

  getLoc() async {
    // ignore: no_leading_underscores_for_local_identifiers
    bool _serviceEnabled;
    // ignore: no_leading_underscores_for_local_identifiers
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

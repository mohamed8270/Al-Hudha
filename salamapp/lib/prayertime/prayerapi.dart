// ignore: import_of_legacy_library_into_null_safe
import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:intl/intl.dart';
import 'package:salamapp/theme/colors.dart';

class PrayerApi extends StatefulWidget {
  const PrayerApi({Key? key}) : super(key: key);

  @override
  State<PrayerApi> createState() => _PrayerApiState();
}

class _PrayerApiState extends State<PrayerApi> {
  Location location = Location();
  LocationData? _currentPosition;
  double? latitude, longitude;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getLoc(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Kred,
              ),
            );
          }

          final myCoordinates = Coordinates(33.769933, 72.8248431);
          final params = CalculationMethod.karachi.getParameters();
          params.madhab = Madhab.hanafi;
          final prayerTimes = PrayerTimes.today(myCoordinates, params);

          return Text(
            DateFormat.jm().format(prayerTimes.fajr),
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

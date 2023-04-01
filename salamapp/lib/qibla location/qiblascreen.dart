import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:get/get.dart';
import 'package:salamapp/qibla%20location/loading_indicator.dart';
import 'package:salamapp/qibla%20location/qibla_compass.dart';
import 'package:salamapp/qibla%20location/qibla_maps.dart';
import 'package:salamapp/theme/colors.dart';

class QiblaScreen extends StatefulWidget {
  const QiblaScreen({Key? key}) : super(key: key);

  @override
  State<QiblaScreen> createState() => _QiblaScreenState();
}

class _QiblaScreenState extends State<QiblaScreen>
    with SingleTickerProviderStateMixin {
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();

  @override
  Widget build(BuildContext context) {
    var siZe = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Zwhite,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 400,
              width: 380,
              decoration: BoxDecoration(
                color: Zgrey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: FutureBuilder(
                future: _deviceSupport,
                builder: (_, AsyncSnapshot<bool?> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return LoadingIndicator();
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Error: ${snapshot.error.toString()}"),
                    );
                  }

                  if (snapshot.data!) {
                    return QiblahCompass();
                  } else {
                    return QiblahMaps();
                  }
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Importance of praying Salah on time",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Zred,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "As Narrated by Ibn Umar, Allah's Messenger said: 'The beginning of the time for Salah is pleasing to Allah, and the end of its time is pardoned by Allah. (Jami at-Tirmidhi 172), so don't you want to begin the prayer on time and at earliest to please your Almighty, without which you cannot attain the place in Jannah.",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Zblack.withOpacity(0.4),
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 30),
            InkWell(
              borderRadius: BorderRadius.circular(40),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QiblahMaps(),
                  ),
                );
              },
              child: Center(
                child: Container(
                  height: siZe.height * 0.06,
                  width: siZe.width * 0.6,
                  decoration: BoxDecoration(
                    color: Zred,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "Map View",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Zwhite,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

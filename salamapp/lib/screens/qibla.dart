import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:salamapp/qibla%20location/qiblascreen.dart';
import 'package:salamapp/theme/colors.dart';

class QiblaDirection extends StatefulWidget {
  const QiblaDirection({Key? key}) : super(key: key);

  @override
  State<QiblaDirection> createState() => _QiblaDirectionState();
}

class _QiblaDirectionState extends State<QiblaDirection> {
  bool hasPermission = false;

  Future getPermission() async {
    if (await Permission.location.serviceStatus.isEnabled) {
      var status = await Permission.location.status;
      if (status.isGranted) {
        hasPermission = true;
      } else {
        Permission.location.request().then(
          (value) {
            setState(() {
              hasPermission = (value == PermissionStatus.granted);
            });
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kblack,
      appBar: AppBar(
        backgroundColor: Kblack,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
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
          'Qibla Direction',
          style: TextStyle(
            fontSize: 20,
            color: Kwhite.withOpacity(0.3),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (hasPermission) {
            return const QiblaScreen();
          } else {
            return const Scaffold(
              backgroundColor: Kblack,
            );
          }
        },
        future: getPermission(),
      ),
    );
  }
}

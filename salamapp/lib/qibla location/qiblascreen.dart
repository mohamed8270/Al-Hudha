import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:salamapp/theme/colors.dart';

class QiblaScreen extends StatefulWidget {
  const QiblaScreen({Key? key}) : super(key: key);

  @override
  State<QiblaScreen> createState() => _QiblaScreenState();
}

Animation? animation;
AnimationController? _animationController;
double begin = 0.0;

class _QiblaScreenState extends State<QiblaScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animation = Tween(begin: 0.0, end: 0.0).animate(_animationController!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kblack,
      body: StreamBuilder(
        stream: FlutterQiblah.qiblahStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            CircularProgressIndicator(
              color: Kred,
            );
          }

          final qiblahDirection = snapshot.data;
          animation = Tween(
                  begin: begin,
                  end: (qiblahDirection!.qiblah * (pi / 180) * -1))
              .animate(_animationController!);
          begin = (qiblahDirection.qiblah * (pi / 180) * -1);
          _animationController!.forward(from: 0);

          return Center(
            child: Column(
              children: [
                Text(
                  "${qiblahDirection.direction.toInt()}°",
                  style: TextStyle(
                    color: Kwhite,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(150),
                    ),
                    child: AnimatedBuilder(
                      animation: animation!,
                      builder: (context, child) => Transform.rotate(
                        angle: animation!.value,
                        child: Image.asset('assets/images/compass.png'),
                      ),
                    ))
              ],
            ),
          );
        },
      ),
    );
  }
}

// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salamapp/interface/bottomnav.dart';
import 'package:salamapp/onboard%20screen/onboardcontent.dart';
import 'package:salamapp/theme/colors.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  int CurrentIndex = 0;
  PageController? _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kblack,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: content.length,
              onPageChanged: (int index) {
                setState(() {
                  CurrentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 80),
                  child: Column(
                    children: [
                      Container(
                        height: 250,
                        width: 350,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50)),
                        child: Image(
                          image: AssetImage(content[i].image),
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        content[i].title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Kwhite,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        content[i].description,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Kwhite.withOpacity(0.3),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                content.length,
                (index) => builddot(index, context),
              ),
            ),
          ),
          Container(
            height: 60,
            width: double.infinity,
            color: Kwhite.withOpacity(0.03),
            margin: EdgeInsets.all(40),
            child: FlatButton(
              onPressed: () {
                if (CurrentIndex == content.length - 1) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BottomNav(),
                    ),
                  );
                }
                _controller?.nextPage(
                    duration: Duration(milliseconds: 100),
                    curve: Curves.bounceIn);
              },
              child: Text(
                CurrentIndex == content.length - 1 ? "Continue" : "Next",
                style: TextStyle(color: Kwhite, fontWeight: FontWeight.w500),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container builddot(int index, BuildContext context) {
    return Container(
      height: 5,
      width: CurrentIndex == index ? 15 : 5,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: CurrentIndex == index ? Kwhite : Kwhite.withOpacity(0.3),
      ),
    );
  }
}

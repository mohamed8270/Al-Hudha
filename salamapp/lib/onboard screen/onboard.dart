// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:salamapp/auth_services.dart';
import 'package:salamapp/onboard%20screen/onboardcontent.dart';
import 'package:salamapp/theme/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  // ignore: non_constant_identifier_names
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

  _storeOnboardInfo() async {
    // ignore: avoid_print
    print("Shared pref called");
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
    // ignore: avoid_print
    print(prefs.getInt('onBoard'));
  }

  @override
  Widget build(BuildContext context) {
    var siZe = MediaQuery.of(context).size;
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
                        height: siZe.height * 0.3,
                        width: siZe.width * 0.7,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50)),
                        child: Image(
                          image: AssetImage(content[i].image),
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        content[i].title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Kwhite,
                        ),
                      ),
                      const SizedBox(height: 20),
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
          // ignore: avoid_unnecessary_containers
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
            margin: const EdgeInsets.all(40),
            child: FlatButton(
              onPressed: () async {
                if (CurrentIndex == content.length - 1) {
                  await _storeOnboardInfo();
                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => AuthService().handleAuthState(),
                    ),
                  );
                }
                _controller?.nextPage(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.bounceIn);
              },
              child: Text(
                CurrentIndex == content.length - 1 ? "Continue" : "Next",
                style:
                    const TextStyle(color: Kwhite, fontWeight: FontWeight.w500),
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
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: CurrentIndex == index ? Kwhite : Kwhite.withOpacity(0.3),
      ),
    );
  }
}

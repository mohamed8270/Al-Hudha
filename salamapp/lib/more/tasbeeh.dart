import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salamapp/theme/colors.dart';

class TasbeehSalam extends StatefulWidget {
  const TasbeehSalam({Key? key}) : super(key: key);

  @override
  State<TasbeehSalam> createState() => _TasbeehSalamState();
}

class _TasbeehSalamState extends State<TasbeehSalam> {
  int Counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kblack,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Kblack,
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
              color: Kred,
            ),
          ),
        ),
        title: Text(
          'Tasbeeh',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Kwhite.withOpacity(0.3),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Kwhite.withOpacity(0.02),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.add_rounded,
                      color: Kwhite,
                    ),
                  ),
                  SizedBox(width: 10),
                  InkWell(
                    onTap: () {},
                    child: TasbihBox(
                      txt: 'لا إله إلا الله محمد رسول الله',
                    ),
                  ),
                  SizedBox(width: 10),
                  InkWell(
                    onTap: () {},
                    child: TasbihBox(
                      txt: 'سبحان الله',
                    ),
                  ),
                  SizedBox(width: 10),
                  InkWell(
                    onTap: () {},
                    child: TasbihBox(
                      txt: 'الله أكبر',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Text(
              '${Counter}',
              style: TextStyle(
                fontSize: 70,
                fontWeight: FontWeight.w500,
                color: Kwhite,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'لا إله إلا الله محمد رسول الله',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Kwhite.withOpacity(0.5),
              ),
            ),
            SizedBox(height: 60),
            InkWell(
              onTap: () {
                setState(() {
                  Counter++;
                });
              },
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Kwhite.withOpacity(0.03),
                ),
                child: Icon(
                  Icons.touch_app_rounded,
                  color: Kwhite,
                  size: 100,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        Counter = 0;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Kwhite.withOpacity(0.03),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.loop_outlined,
                        color: Kred,
                        size: 26,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Kwhite.withOpacity(0.03),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.audiotrack_outlined,
                        color: Kred,
                        size: 26,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TasbihBox extends StatelessWidget {
  const TasbihBox({
    Key? key,
    required this.txt,
  }) : super(key: key);
  final String txt;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: double.infinity,
      ),
      height: 50,
      decoration: BoxDecoration(
          color: Kwhite.withOpacity(0.02),
          borderRadius: BorderRadius.circular(10)),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          txt,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Kred,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salamapp/theme/colors.dart';

class TasbeehSalam extends StatefulWidget {
  const TasbeehSalam({Key? key}) : super(key: key);

  @override
  State<TasbeehSalam> createState() => _TasbeehSalamState();
}

class _TasbeehSalamState extends State<TasbeehSalam> {
  // ignore: non_constant_identifier_names
  int Counter = 0;

  @override
  Widget build(BuildContext context) {
    var siZe = MediaQuery.of(context).size;
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
        padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: 10),
                  InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {},
                    child: const TasbihBox(
                      txt: 'لا إله إلا الله محمد رسول الله',
                    ),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {},
                    child: const TasbihBox(
                      txt: 'سبحان الله',
                    ),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {},
                    child: const TasbihBox(
                      txt: 'الله أكبر',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Container(
              height: siZe.height * 0.21,
              width: siZe.width * 0.95,
              decoration: BoxDecoration(
                color: Kwhite.withOpacity(0.03),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Container(
                    width: siZe.width * 0.4,
                    height: siZe.height * 0.21,
                    decoration: const BoxDecoration(
                      color: Kred,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      // ignore: unnecessary_brace_in_string_interps
                      '${Counter}',
                      style: const TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.w500,
                        color: Kwhite,
                      ),
                    ),
                  ),
                  Container(
                    height: siZe.height * 0.21,
                    width: siZe.width * 0.545,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Benefits of Dhikr",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Kred,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Dhikr will be a nur for you in your grave, and on the Day of Judgement. This nur will keep you steady on the sirat (a bridge which must be passed on the Day of Judgement) that will guide you to Paradise",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              color: Kwhite.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 60),
            InkWell(
              borderRadius: BorderRadius.circular(100),
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
                child: const Icon(
                  Icons.touch_app_rounded,
                  color: Kwhite,
                  size: 100,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
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
                      child: const Icon(
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
                      child: const Icon(
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
      constraints: const BoxConstraints(
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
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Kred,
          ),
        ),
      ),
    );
  }
}

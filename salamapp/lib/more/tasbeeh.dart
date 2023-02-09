import 'package:flutter/material.dart';
import 'package:salamapp/external/podcast.dart';
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
      backgroundColor: Zwhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Zwhite,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_rounded,
            color: Zred,
          ),
        ),
        title: Text(
          'Tasbeeh',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Zblack.withOpacity(0.5),
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
                color: Zgrey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Container(
                    width: siZe.width * 0.4,
                    height: siZe.height * 0.21,
                    decoration: const BoxDecoration(
                      color: Zred,
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
                        color: Zwhite,
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
                              color: Zred,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Dhikr will be a nur for you in your grave, and on the Day of Judgement. This nur will keep you steady on the sirat (a bridge which must be passed on the Day of Judgement) that will guide you to Paradise",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              color: Zblack.withOpacity(0.4),
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
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Zgrey,
                ),
                child: const Icon(
                  Icons.touch_app_rounded,
                  color: Zred,
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
                        color: Zgrey,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.loop_outlined,
                        color: Zred,
                        size: 26,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PodCast(),
                        ),
                      );
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Zgrey,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.audiotrack_outlined,
                        color: Zred,
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
      decoration:
          BoxDecoration(color: Zgrey, borderRadius: BorderRadius.circular(10)),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          txt,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Zred,
          ),
        ),
      ),
    );
  }
}

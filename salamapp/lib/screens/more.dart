import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salamapp/interface/bottomnav.dart';
import 'package:salamapp/more/hadith.dart';
import 'package:salamapp/more/tasbeeh.dart';
import 'package:salamapp/more/zakatcal.dart';
import 'package:salamapp/theme/colors.dart';

class More extends StatefulWidget {
  const More({Key? key}) : super(key: key);

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  int _Count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kblack,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Kblack,
        leading: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BottomNav(),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SvgPicture.asset(
              'assets/icons/back.svg',
              height: 18,
              width: 18,
              color: Kred,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        title: Text(
          'More',
          style: TextStyle(
            fontSize: 20,
            color: Kred,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ZakatCalc(Controller: TextEditingController()),
                    ),
                  );
                },
                child: MoreItems(
                  txt: 'Zakat Calculator',
                ),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TasbeehSalam(),
                    ),
                  );
                },
                child: MoreItems(
                  txt: 'Tasbeeh',
                ),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HadithSalam(),
                    ),
                  );
                },
                child: MoreItems(
                  txt: 'Hadiths',
                ),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () {},
                child: MoreItems(
                  txt: 'Charity Donation',
                ),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () {},
                child: MoreItems(
                  txt: 'Quiz',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MoreItems extends StatelessWidget {
  const MoreItems({
    Key? key,
    required this.txt,
  }) : super(key: key);
  final String txt;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 400,
      decoration: BoxDecoration(
        color: Kwhite.withOpacity(0.02),
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
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

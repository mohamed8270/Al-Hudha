import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salamapp/theme/colors.dart';

class BenefitsScreen extends StatefulWidget {
  const BenefitsScreen({Key? key}) : super(key: key);

  @override
  State<BenefitsScreen> createState() => _BenefitsScreenState();
}

class _BenefitsScreenState extends State<BenefitsScreen> {
  // ignore: non_constant_identifier_names
  List Benefitslist = [];

  @override
  initState() {
    super.initState();

    _readBenefits();
  }

  _readBenefits() async {
    await DefaultAssetBundle.of(context)
        .loadString("assets/benefits_json/Benefits.json")
        .then((s) {
      setState(() {
        Benefitslist = json.decode(s);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var siZe = MediaQuery.of(context).size;
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
              color: Kred,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        title: Text(
          'Benefits of surah',
          style: TextStyle(
            fontSize: 20,
            color: Kwhite.withOpacity(0.3),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: siZe.height * 0.19,
                width: siZe.width * 0.95,
                decoration: BoxDecoration(
                  color: Kwhite.withOpacity(0.03),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Know the benefits",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "The one who is proficient in the recitation of the Qur'an will be with the honourable and obedient scribes (angels), and he who recites the Qur'an and finds it difficult to recite, doing his best to recite it in the best way possible, will have two rewards.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Kwhite.withOpacity(0.5),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ListView.builder(
                itemCount: Benefitslist.length,
                scrollDirection: Axis.vertical,
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: ((context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: siZe.height * 0.05,
                        width: double.infinity,
                        color: Kwhite.withOpacity(0.03),
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Container(
                              height: siZe.height * 0.035,
                              width: siZe.width * 0.01,
                              decoration: BoxDecoration(
                                color: Kwhite,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              Benefitslist[index]["heading"],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Kred,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        Benefitslist[index]["subheading"],
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Kwhite.withOpacity(0.5),
                        ),
                      ),
                      const Text('\n')
                    ],
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

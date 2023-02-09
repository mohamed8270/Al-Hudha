import 'dart:convert';
import 'package:flutter/material.dart';
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
      backgroundColor: Zwhite,
      appBar: AppBar(
        backgroundColor: Zwhite,
        elevation: 0,
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
          'Benefits of surah',
          style: TextStyle(
            fontSize: 20,
            color: Zblack.withOpacity(0.5),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 0, left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                constraints: const BoxConstraints(maxHeight: double.infinity),
                width: siZe.width * 0.95,
                decoration: const BoxDecoration(
                  color: Zgrey,
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
                          color: Zblack,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "The one who is proficient in the recitation of the Qur'an will be with the honourable and obedient scribes (angels), and he who recites the Qur'an and finds it difficult to recite, doing his best to recite it in the best way possible, will have two rewards.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Zblack.withOpacity(0.4),
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
                        color: Zgrey,
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Container(
                              height: siZe.height * 0.035,
                              width: siZe.width * 0.01,
                              decoration: BoxDecoration(
                                color: Zred,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              Benefitslist[index]["heading"],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Zblack,
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
                          color: Zblack.withOpacity(0.4),
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

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salamapp/more/charity.dart';
import 'package:salamapp/theme/colors.dart';

class ZakatCalc extends StatefulWidget {
  // ignore: non_constant_identifier_names
  const ZakatCalc({Key? key, required this.Controller}) : super(key: key);
  // ignore: non_constant_identifier_names
  final TextEditingController Controller;

  @override
  State<ZakatCalc> createState() => _ZakatCalcState();
}

class _ZakatCalcState extends State<ZakatCalc> {
  final _num1 = TextEditingController();
  final _num2 = TextEditingController();
  int _tot = 0;

  late int result;
  late int sum;
  late int zakat;
  late int zakatres;
  int _zakat = 0;
  double zakatvalue = 0.025;
  @override
  Widget build(BuildContext context) {
    var siZe = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Zwhite,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Zred,
        elevation: 3,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CharityPage(),
            ),
          );
        },
        child: SvgPicture.asset(
          'assets/icons/donate.svg',
          height: 20,
          width: 20,
          color: Zwhite,
        ),
      ),
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
          'Zakat Calculator',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Zblack.withOpacity(0.5),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              constraints: const BoxConstraints(
                maxHeight: double.infinity,
              ),
              width: siZe.width * 0.95,
              decoration: BoxDecoration(
                color: Zgrey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.info_outline_rounded,
                          color: Zred.withOpacity(0.5),
                          size: 22,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "Note",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Zblack,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "In India, Most of the regions gold quanities are mentioned in pawn, Hence one pawn is referreneced as 8 grams of gold (ie: If you have 5 pawn then 5 * 8 = 40 grams). Each and every muslim with eligible quantity should provide 2.5% of their Gold, Silver, etc as a Zakat. Help the needy or contribute to the goodness of your akirah",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Zblack.withOpacity(0.5),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: siZe.height * 0.33,
              width: siZe.width * 0.95,
              decoration: BoxDecoration(
                color: Zgrey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "24 Carat Gold/Jewelry",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Zblack,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: siZe.width * 0.43,
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: _num1,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Zblack.withOpacity(0.3))),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Zred)),
                                labelText: 'Weight in Grams',
                                labelStyle: TextStyle(
                                  color: Zblack.withOpacity(0.5),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: siZe.width * 0.43,
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: _num2,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Zblack.withOpacity(0.3))),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Zred)),
                                labelText: 'Price/Gm',
                                labelStyle: TextStyle(
                                  color: Zblack.withOpacity(0.5),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Estimated Value",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Zblack,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              '\u{20B9} ${_tot}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: Zred.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Zakat Payable",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Zblack,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              '\u{20B9} ${_zakat}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: Zred.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    InkWell(
                      borderRadius: BorderRadius.circular(40),
                      onTap: () {
                        setState(() {
                          sum = int.parse(_num1.text) * int.parse(_num2.text);
                          result = sum;
                          _tot = result;
                        });
                        setState(() {
                          zakat = (int.parse(_num1.text) * zakatvalue).toInt();
                          zakatres = zakat * int.parse(_num2.text);
                          _zakat = zakatres;
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Zblack,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'Calculate',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: Zwhite,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

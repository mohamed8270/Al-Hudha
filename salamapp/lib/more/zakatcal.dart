import 'package:flutter/material.dart';
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
  final _tot = TextEditingController();

  // ignore: no_leading_underscores_for_local_identifiers
  double calculateZakat(double _num1) {
    // ignore: prefer_const_declarations
    final nisab = 85; // the minimum amount of wealth required to pay Zakat
    if (_num1 < nisab) {
      return 0;
    }
    return (_num1 * 0.025);
  }

  late int result;
  late int sum;
  @override
  Widget build(BuildContext context) {
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
          'Zakat Calculator',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Zblack.withOpacity(0.5),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: _num1,
              decoration: const InputDecoration(
                enabledBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: Zgrey)),
                focusedBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: Zred)),
                labelText: 'Gold in grams',
                labelStyle: TextStyle(color: Zblack),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: _num2,
              decoration: const InputDecoration(
                enabledBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: Zgrey)),
                focusedBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: Zred)),
                labelText: 'Price of Gold',
                labelStyle: TextStyle(color: Zblack),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: _tot,
              decoration: const InputDecoration(
                enabledBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: Zgrey)),
                focusedBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: Zred)),
                labelText: 'Zakat Money',
                labelStyle: TextStyle(color: Zblack),
              ),
            ),
          ),
          const SizedBox(height: 10),
          InkWell(
            onTap: () {
              sum = int.parse(_num1.text) * int.parse(_num2.text);
              result = sum;
              _tot.text = result.toString();
            },
            child: Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                color: Zgrey,
                borderRadius: BorderRadius.circular(40),
              ),
              alignment: Alignment.center,
              child: const Text(
                'Calculate',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Zred,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salamapp/theme/colors.dart';

class ZakatCalc extends StatefulWidget {
  const ZakatCalc({Key? key, required this.Controller}) : super(key: key);
  final TextEditingController Controller;

  @override
  State<ZakatCalc> createState() => _ZakatCalcState();
}

class _ZakatCalcState extends State<ZakatCalc> {
  final _num1 = TextEditingController();
  final _num2 = TextEditingController();
  final _tot = TextEditingController();

  late int result;
  late int sum;
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
              height: 12,
              width: 12,
              color: Kred,
            ),
          ),
        ),
        title: Text(
          'Zakat Calculator',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Kwhite.withOpacity(0.3),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: _num1,
              decoration: InputDecoration(
                enabledBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: Kwhite)),
                focusedBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: Kred)),
                labelText: 'Gold in grams',
                labelStyle: TextStyle(color: Kwhite),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: _num2,
              decoration: InputDecoration(
                enabledBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: Kwhite)),
                focusedBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: Kred)),
                labelText: 'Price of Gold',
                labelStyle: TextStyle(color: Kwhite),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: _tot,
              decoration: InputDecoration(
                enabledBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: Kwhite)),
                focusedBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: Kred)),
                labelText: 'Zakat Money',
                labelStyle: TextStyle(color: Kwhite),
              ),
            ),
          ),
          SizedBox(height: 10),
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
                color: Kwhite.withOpacity(0.02),
                borderRadius: BorderRadius.circular(40),
              ),
              alignment: Alignment.center,
              child: Text(
                'Calculate',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Kwhite,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

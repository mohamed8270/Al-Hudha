import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salamapp/theme/colors.dart';

class HalalStocks extends StatefulWidget {
  const HalalStocks({Key? key}) : super(key: key);

  @override
  State<HalalStocks> createState() => _HalalStocksState();
}

class _HalalStocksState extends State<HalalStocks> {
  // ignore: non_constant_identifier_names
  List Stockslist = [];
  @override
  void initState() {
    super.initState();
    _StocksData();
  }

  // ignore: non_constant_identifier_names
  _StocksData() async {
    await DefaultAssetBundle.of(context)
        .loadString("assets/stock_json/Stock.json")
        .then((s) {
      setState(() {
        Stockslist = json.decode(s);
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
          'Halal Stocks',
          style: TextStyle(
            fontSize: 20,
            color: Kwhite.withOpacity(0.3),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: siZe.height * 0.25,
                width: siZe.width * 0.95,
                decoration: BoxDecoration(
                  color: Kwhite.withOpacity(0.03),
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/stock03.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 77, left: 10),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          height: siZe.height * 0.055,
                          width: siZe.width * 0.4,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.green,
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            "Learn More",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Kblack,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              ListView.builder(
                itemCount: Stockslist.length,
                scrollDirection: Axis.vertical,
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: ((context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Stockslist[index]["heading"],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        Stockslist[index]["subheading01"],
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Kwhite.withOpacity(0.5),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        Stockslist[index]["subheading02"],
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Kwhite.withOpacity(0.5),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        Stockslist[index]["subheading03"],
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Kwhite.withOpacity(0.5),
                        ),
                      ),
                      const Text('\n'),
                      Divider(
                        color: Kwhite.withOpacity(0.5),
                        thickness: 1,
                      )
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

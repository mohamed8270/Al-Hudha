import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:salamapp/theme/colors.dart';
import 'package:url_launcher/url_launcher.dart';

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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Zred,
        // ignore: deprecated_member_use
        onPressed: () => launch(
            'https://play.google.com/store/apps/details?id=com.axonlogic.stocktrade'),
        child: const Icon(
          Icons.download,
          color: Zwhite,
        ),
      ),
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
          'Halal Stocks',
          style: TextStyle(
            fontSize: 20,
            color: Zblack.withOpacity(0.5),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 0, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: siZe.height * 0.25,
                width: siZe.width * 0.95,
                decoration: BoxDecoration(
                  color: Zgrey,
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/stock03.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                clipBehavior: Clip.hardEdge,
              ),
              const SizedBox(height: 10),
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
                          color: Zblack,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        Stockslist[index]["subheading01"],
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Zblack.withOpacity(0.4),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        Stockslist[index]["subheading02"],
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Zblack.withOpacity(0.4),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        Stockslist[index]["subheading03"],
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Zblack.withOpacity(0.4),
                        ),
                      ),
                      const SizedBox(height: 15),
                    ],
                  );
                }),
              ),
              InkWell(
                // ignore: deprecated_member_use
                onTap: () => launch(
                    'https://academy.musaffa.com/5-tips-on-how-to-invest-in-stocks-a-guide-for-muslims/'),
                child: Container(
                  height: siZe.height * 0.08,
                  constraints: const BoxConstraints(
                    maxWidth: double.infinity,
                  ),
                  decoration: BoxDecoration(
                    color: Zred,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "Learn More",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Zwhite,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 70),
            ],
          ),
        ),
      ),
    );
  }
}

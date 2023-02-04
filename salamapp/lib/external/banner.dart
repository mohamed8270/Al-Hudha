import 'package:flutter/material.dart';
import 'package:salamapp/theme/colors.dart';

class BannerCards extends StatelessWidget {
  const BannerCards({
    Key? key,
    required this.img,
    required this.title,
    required this.des,
  }) : super(key: key);

  final String img;
  final String title;
  final String des;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            color: KPurewhite,
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(
                img,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 150,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: KBlack,
              overflow: TextOverflow.ellipsis,
            ),
            maxLines: 1,
            softWrap: true,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          des,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w800,
            color: KBlack.withOpacity(0.6),
          ),
        )
      ],
    );
  }
}

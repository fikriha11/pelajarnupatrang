import 'package:flutter/material.dart';

import '../../../constant/color.dart';
import '../../../constant/size_config.dart';
import 'package:google_fonts/google_fonts.dart';

class VersesView extends StatelessWidget {
  const VersesView({super.key});

  @override
  Widget build(BuildContext context) {
    final SizeConfig sizeConfig = SizeConfig(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: sizeConfig.getProportionateScreenWidth(15),
        vertical: sizeConfig.getProportionateScreenHeight(5),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    height: 70,
                    width: 30,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/img/list.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        '1',
                        style: TextStyle(
                          color: appBlack,
                        ),
                      ),
                    ),
                  ),
                  const CircleAvatar(
                    radius: 15.0,
                    backgroundColor: appWhite,
                    child: Text(
                      '1',
                      style: TextStyle(color: appWhite),
                    ),
                  ),
                ],
              ),
              SizedBox(width: sizeConfig.getProportionateScreenWidth(10)),
              Expanded(
                child: Text(
                  'خَتَمَ اللّٰهُ عَلٰى قُلُوْبِهِمْ وَعَلٰى سَمْعِهِمْ ۗ وَعَلٰٓى اَبْصَارِهِمْ غِشَاوَةٌ وَّلَهُمْ عَذَابٌ عَظِيْمٌ',
                  textAlign: TextAlign.end,
                  style: GoogleFonts.amiriQuran(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    wordSpacing: 2.0,
                    height: 2.3,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: sizeConfig.getProportionateScreenHeight(10)),
          const Text(
            "Allah telah mengunci hati dan pendengaran mereka, penglihatan mereka telah tertutup, dan mereka akan mendapat azab yang berat.",
            style: TextStyle(
              fontSize: 12,
            ),
            textAlign: TextAlign.start,
          ),
          const Divider(
            color: appBlack,
            thickness: 0.6,
          ),
        ],
      ),
    );
  }
}

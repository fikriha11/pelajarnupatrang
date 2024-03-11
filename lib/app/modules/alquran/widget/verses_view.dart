import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/quran.dart' as quran;

import '../../../constant/color.dart';
import '../../../constant/size_config.dart';
import '../../../data/model/detail_surah.dart';
import '../controllers/detail_surah_controller.dart';

class VersesView extends GetView<DetailSurahController> {
  const VersesView({super.key, required this.ayat});
  final Ayat ayat;
  @override
  Widget build(BuildContext context) {
    final SizeConfig sizeConfig = SizeConfig(context);
    return Padding(
      padding: EdgeInsets.only(
        top: sizeConfig.getProportionateScreenHeight(10),
        bottom: sizeConfig.getProportionateScreenHeight(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                color: appBlack,
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: sizeConfig.getProportionateScreenWidth(20),
                    left: sizeConfig.getProportionateScreenWidth(20),
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                text: '${ayat.ar} ',
                                style: const TextStyle(
                                  fontFamily: 'Lpmq',
                                  color: appBlack,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  wordSpacing: 1.0,
                                  height: 2.0,
                                ),
                                children: [
                                  TextSpan(
                                    text: quran.getVerseEndSymbol(
                                      ayat.nomor!.toInt(),
                                    ),
                                    style: GoogleFonts.lateef(
                                      color: appBlueLight2,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      wordSpacing: 1.0,
                                      height: 2.3,
                                    ),
                                  )
                                ],
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                          height: sizeConfig.getProportionateScreenHeight(20)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              "${ayat.tr}",
                              style: const TextStyle(
                                  fontSize: 13, color: appBlueLight2),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                          height: sizeConfig.getProportionateScreenHeight(10)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              "${ayat.idn}",
                              style: const TextStyle(
                                fontSize: 13,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          const Divider(
            thickness: 0.6,
            color: appBlack,
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant/color.dart';
import '../../../constant/size_config.dart';
import '../../../data/model/detail_surah.dart';

class VersesView extends StatelessWidget {
  const VersesView(
      {super.key, required this.translation, required this.verses});
  final Ayat translation;
  final String verses;
  @override
  Widget build(BuildContext context) {
    final SizeConfig sizeConfig = SizeConfig(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: sizeConfig.getProportionateScreenWidth(15),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: sizeConfig.getProportionateScreenWidth(30),
                width: sizeConfig.getProportionateScreenHeight(30),
                decoration: const BoxDecoration(
                  // color: Colors.black,
                  image: DecorationImage(
                    image: AssetImage('assets/img/list.png'),
                    fit: BoxFit.contain,
                  ),
                ),
                child: Center(
                  child: Text(
                    '${translation.nomor}',
                    style: const TextStyle(
                      color: appBlack,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: sizeConfig.getProportionateScreenWidth(10),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      // '${ayatDetail.ar}',
                      verses,
                      textAlign: TextAlign.end,
                      style: GoogleFonts.amiri(
                        fontSize: 25,
                        wordSpacing: 2.0,
                        height: 2.7,
                      ),
                    ),
                    SizedBox(
                      height: sizeConfig.getProportionateScreenHeight(30),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "${translation.idn}",
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

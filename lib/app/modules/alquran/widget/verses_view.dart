import 'package:flutter/material.dart';

import '../../../constant/color.dart';
import '../../../constant/size_config.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/model/detail_surah.dart';

class VersesView extends StatelessWidget {
  const VersesView({super.key, required this.ayatDetail});
  final Ayat ayatDetail;
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: sizeConfig.getProportionateScreenWidth(70),
                width: sizeConfig.getProportionateScreenHeight(30),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/img/list.png'),
                    fit: BoxFit.contain,
                  ),
                ),
                child: Center(
                  child: Text(
                    '${ayatDetail.nomor}',
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
                      '${ayatDetail.ar}',
                      textAlign: TextAlign.end,
                      style: GoogleFonts.amiriQuran(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        wordSpacing: 2.0,
                        height: 2.0,
                      ),
                    ),
                    SizedBox(
                      height: sizeConfig.getProportionateScreenHeight(15),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "${ayatDetail.idn}",
                            style: const TextStyle(
                              fontSize: 12,
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

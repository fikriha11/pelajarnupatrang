import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                    '${ayat.nomor}',
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
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        '${ayat.ar}',
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontSize: 25,
                          fontFamily: 'Lpmq',
                          wordSpacing: 2.0,
                          height: 2.3,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: sizeConfig.getProportionateScreenHeight(30),
                    ),
                    Row(
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

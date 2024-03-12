import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pelajarnupatrang/app/modules/alquran/widget/tile_feature.dart';

import '../../../constant/size_config.dart';

class ModalVerses {
  Future show(BuildContext context) {
    final SizeConfig sizeConfig = SizeConfig(context);
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          width: Get.width,
          height: Get.height * 0.35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: sizeConfig.getProportionateScreenWidth(100),
                  height: sizeConfig.getProportionateScreenHeight(8),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: sizeConfig.getProportionateScreenHeight(20)),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: sizeConfig.getProportionateScreenHeight(5),
                  horizontal: sizeConfig.getProportionateScreenWidth(20),
                ),
                child: const Text('QS. Al baqarah: Ayat 2'),
              ),
              const TileFeature(
                icon: Icons.play_arrow,
                title: 'Play Ayat',
              ),
              const TileFeature(
                icon: Icons.book,
                title: 'Tandai Terakhir Membaca',
              ),
              const TileFeature(
                icon: Icons.bookmark_add,
                title: 'Simpan Ke Bookmark',
              ),
            ],
          ),
        );
      },
    );
  }
}

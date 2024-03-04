import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pelajarnupatrang/app/constant/color.dart';
import 'package:pelajarnupatrang/app/modules/home/widget/card_widget.dart';

import '../../../constant/size_config.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final SizeConfig sizeConfig = SizeConfig(context);
    return Scaffold(
        appBar: AppBar(
          title: SizedBox(
            width: 180,
            height: 75,
            child: Image.asset(
              'assets/img/logo-appbar.png',
            ),
          ),
          centerTitle: true,
        ),
        drawer: Drawer(
          child: ListView(
            children: const [],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
          child: ListView(
            children: [
              const Text(
                'Selamat Datang',
                style: TextStyle(
                  fontSize: 16,
                  color: appGrey,
                ),
              ),
              const Text(
                "Assalamu'alaikum",
                style: TextStyle(
                  fontSize: 20,
                  color: appBlack,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: sizeConfig.getProportionateScreenHeight(20)),
              CardWidget(
                title: "Al - Qur'an",
                route: () {
                  Get.toNamed(Routes.ALQURAN);
                },
              ),
              CardWidget(
                title: "Rotibul Haddad",
                route: () {
                  Get.toNamed(Routes.ROTIB);
                },
              ),
              const CardWidget(title: "Baca Tahlil"),
              const CardWidget(title: "Doa Sholat"),
              const CardWidget(title: "Pelajar NU Pedia"),
            ],
          ),
        ));
  }
}

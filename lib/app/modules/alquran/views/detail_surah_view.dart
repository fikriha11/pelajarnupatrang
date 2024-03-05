import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pelajarnupatrang/app/data/model/detail_surah.dart';
import 'package:pelajarnupatrang/app/modules/alquran/widget/verses_view.dart';
import '../../../constant/color.dart';
import '../../../constant/size_config.dart';
import '../../../data/model/surah.dart';
import '../controllers/detail_surah_controller.dart';

class DetailSurahView extends GetView<DetailSurahController> {
  DetailSurahView({Key? key}) : super(key: key);
  final Surah surah = Get.arguments;
  @override
  Widget build(BuildContext context) {
    final SizeConfig sizeConfig = SizeConfig(context);
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          width: sizeConfig.getProportionateScreenWidth(180),
          height: sizeConfig.getProportionateScreenHeight(70),
          child: Image.asset(
            'assets/img/logo-appbar.png',
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<DetailSurah>(
        future: controller.getAllDetailSurah(surah.nomor.toString()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData) {
            return const Center(
              child: Text('Tidak Ada Data'),
            );
          }

          return Column(
            children: [
              ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                tileColor: Colors.blue.shade300,
                title: Text(
                  '${snapshot.data!.namaLatin}',
                  style: const TextStyle(
                    color: appWhite,
                  ),
                ),
                subtitle: Text(
                  '${snapshot.data!.jumlahAyat} Ayat | ${snapshot.data!.tempatTurun}',
                  style: const TextStyle(
                    color: appWhite,
                  ),
                ),
                trailing: Text(
                  '${snapshot.data!.nama}',
                  style: const TextStyle(fontSize: 30, color: appWhite),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data!.ayat!.length,
                  itemBuilder: (context, index) {
                    return VersesView(
                      ayatDetail: snapshot.data!.ayat![index],
                    );
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

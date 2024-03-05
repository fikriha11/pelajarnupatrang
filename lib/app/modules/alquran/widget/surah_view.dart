import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pelajarnupatrang/app/constant/color.dart';

import '../../../data/model/surah.dart';
import '../../../routes/app_pages.dart';
import '../controllers/alquran_controller.dart';

class SurahView extends GetView<AlquranController> {
  const SurahView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Surah>>(
      future: controller.getAllSurah(),
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

        return Obx(
          () => ListView.builder(
            itemCount: controller.foundSurah.length,
            itemBuilder: (context, index) {
              Surah surah = controller.foundSurah[index];
              return InkWell(
                onTap: () {
                  Get.toNamed(Routes.DETAIL_SURAH, arguments: surah);
                },
                child: ListTile(
                  leading: Container(
                    height: 70,
                    width: 30,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/img/list.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '${surah.nomor}',
                        style: const TextStyle(
                          color: appBlack,
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    '${surah.namaLatin}',
                    style: const TextStyle(
                      color: appBlack,
                    ),
                  ),
                  subtitle: Text(
                    '${surah.jumlahAyat} ayat | ${surah.tempatTurun}',
                    style: const TextStyle(
                      color: appBlueLight1,
                      fontSize: 14,
                    ),
                  ),
                  trailing: Text(
                    '${surah.nama}',
                    style: const TextStyle(
                      color: appBlack,
                      fontSize: 20,
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

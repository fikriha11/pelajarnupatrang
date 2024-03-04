import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pelajarnupatrang/app/constant/color.dart';

import '../../../data/model/surah.dart';
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

        return ListView.builder(
          itemCount: snapshot.data?.length,
          itemBuilder: (context, index) {
            Surah surah = snapshot.data![index];
            return ListTile(
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
                    '${index + 1}',
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
                '${surah.jumlahAyat} ayat | ${surah.tempatTurun == "mekah" ? "Makiyah" : "Madaniyah"}',
                style: const TextStyle(
                  color: appBlueLight1,
                  fontSize: 14,
                ),
              ),
              trailing: const Text(
                'الفاتحة',
                style: TextStyle(
                  color: appBlack,
                  fontSize: 20,
                ),
              ),
            );
          },
        );
      },
    );
  }
}

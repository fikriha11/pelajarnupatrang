import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant/color.dart';
import '../controllers/detail_surah_controller.dart';
import '../widget/verses_view.dart';

class DetailSurahView extends GetView<DetailSurahController> {
  const DetailSurahView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          width: 180,
          height: 70,
          child: Image.asset(
            'assets/img/logo-appbar.png',
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              tileColor: Colors.blue.shade300,
              title: const Text(
                'Al Baqarah',
                style: TextStyle(
                  color: appWhite,
                ),
              ),
              subtitle: const Text(
                '7 Ayat | Mekkah',
                style: TextStyle(
                  color: appWhite,
                ),
              ),
              trailing: const Text(
                'البقرة',
                style: TextStyle(fontSize: 30, color: appWhite),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const VersesView();
              },
            ),
          )
        ],
      ),
    );
  }
}

import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pelajarnupatrang/app/data/remote/end_point.dart';
import '../../../data/model/surah.dart';

class AlquranController extends GetxController {
  RxList<Surah> foundSurah = <Surah>[].obs;
  List<Surah> allSurah = [];

  Future<List<Surah>> getAllSurah() async {
    Uri url = Uri.parse('${EndPoint.baseUrl}${EndPoint.surah}');
    var res = await http.get(url);

    List data = json.decode(res.body);

    if (data.isEmpty) {
      return [];
    } else {
      allSurah = data.map((e) => Surah.fromJson(e)).toList();
      foundSurah.value = allSurah;
      return allSurah;
    }
  }

  void filterSurah(String surahName) {
    List<Surah> result = [];
    if (surahName.isEmpty) {
      result = allSurah;
    } else {
      result = allSurah
          .where(
            (element) => element.namaLatin.toString().toLowerCase().contains(
                  surahName.toLowerCase(),
                ),
          )
          .toList();
    }
    foundSurah.value = result;
  }
}

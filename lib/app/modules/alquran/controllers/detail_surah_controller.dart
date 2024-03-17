import 'dart:convert';

import 'package:get/get.dart';
import 'package:pelajarnupatrang/app/data/db/bookmark.dart';
import 'package:pelajarnupatrang/app/data/model/detail_surah.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';
import '../../../data/remote/end_point.dart';

class DetailSurahController extends GetxController {
  DatabaseManager database = DatabaseManager.instance;

  void addBookmark(
    bool lastRead,
    DetailSurah surah,
    Ayat ayat,
    int indexAyat,
  ) async {
    Database db = await database.db;

    if (lastRead) {
      await db.delete('bookmark', where: 'lastread = 1');
    }

    await db.insert(
      "bookmark",
      {
        'nameOfSurah': '${surah.namaLatin}',
        'numberOfVerses': '${ayat.nomor}',
        'indexVersesOnSurah': indexAyat,
        'lastRead': lastRead == true ? 1 : 0,
      },
    );

    Get.back();
  }

  Future<DetailSurah> getAllDetailSurah(String id) async {
    Uri url = Uri.parse('${EndPoint.baseUrl}${EndPoint.surah}$id');
    var res = await http.get(url);
    Map<String, dynamic> data = json.decode(res.body);
    return DetailSurah.fromJson(data);
  }
}

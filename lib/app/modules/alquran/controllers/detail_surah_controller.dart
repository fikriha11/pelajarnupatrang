import 'dart:convert';

import 'package:get/get.dart';
import 'package:pelajarnupatrang/app/data/model/detail_surah.dart';
import 'package:http/http.dart' as http;
import '../../../data/remote/end_point.dart';

class DetailSurahController extends GetxController {
  Future<DetailSurah> getAllDetailSurah(String id) async {
    Uri url = Uri.parse('${EndPoint.baseUrl}${EndPoint.surah}$id');
    var res = await http.get(url);
    Map<String, dynamic> data = json.decode(res.body);
    return DetailSurah.fromJson(data);
  }
}

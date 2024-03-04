import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pelajarnupatrang/app/data/remote/end_point.dart';
import '../../../data/model/surah.dart';

class AlquranController extends GetxController {
  TextEditingController controllerField = TextEditingController();
  List<Surah> searchResult = [];
  List<Surah> surahResult = [];

  Future<List<Surah>> getAllSurah() async {
    Uri url = Uri.parse('${EndPoint.baseUrl}${EndPoint.surah}');
    var res = await http.get(url);

    List data = json.decode(res.body);

    if (data.isEmpty) {
      return [];
    } else {
      return data.map((e) => Surah.fromJson(e)).toList();
    }
  }
}

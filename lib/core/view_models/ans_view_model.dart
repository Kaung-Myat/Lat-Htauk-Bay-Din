import 'dart:convert';
import 'package:flutter/services.dart';
import '../../utils/constants.dart';

class Ans {
   static List<dynamic> _ans = [];

   Future loadJsonData() async {
    ByteData data = await rootBundle.load(ansJsonFilePath);

    String jsonString = utf8.decode(data.buffer.asUint8List());
    dynamic jsonData = json.decode(jsonString);

    _ans = jsonData.cast<dynamic>();
  }

   static List<dynamic> getAns() {
    return _ans;
  }
}

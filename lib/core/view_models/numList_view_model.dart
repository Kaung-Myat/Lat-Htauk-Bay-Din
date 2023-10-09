import 'dart:convert';
import 'package:flutter/services.dart';
import '../../utils/constants.dart';

class NumList {
   static List<dynamic> _numList = [];

   Future loadJsonData() async {
    ByteData data = await rootBundle.load(numListJsonFilePath);

    String jsonString = utf8.decode(data.buffer.asUint8List());
    dynamic jsonData = json.decode(jsonString);

    _numList = jsonData.cast<dynamic>();
  }

   static List<dynamic> getNumList() {
    return _numList;
  }
}

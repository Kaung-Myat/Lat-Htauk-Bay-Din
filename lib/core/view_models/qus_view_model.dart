import 'dart:convert';
import 'package:flutter/services.dart';
import '../../utils/constants.dart';

class Ques {
   static List<dynamic> _ques = [];

   Future loadJsonData() async {
    ByteData data = await rootBundle.load(quesJsonFilePath);

    String jsonString = utf8.decode(data.buffer.asUint8List());
    dynamic jsonData = json.decode(jsonString);

    _ques = jsonData.cast<dynamic>();
  }

   static List<dynamic> getQues() {
    return _ques;
  }
}

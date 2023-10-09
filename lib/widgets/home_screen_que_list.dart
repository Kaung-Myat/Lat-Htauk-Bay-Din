// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class QueListWidget extends StatelessWidget {
  String qNo;
  String ques;
  QueListWidget({super.key, required this.qNo, required this.ques});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 0,
              child: Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: Text("$qNo. "),
              )),
          Expanded(
            flex: 1,
            child: Text(
              ques,
            ),
          )
        ],
      ),
    );
  }
}

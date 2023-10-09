// ignore: file_names
import 'package:flutter/material.dart';
import 'package:lat_htauk_day_din/core/view_models/ans_view_model.dart';
import 'package:lat_htauk_day_din/screens/home_screen.dart';
import 'package:lat_htauk_day_din/utils/colors.dart';
import 'package:lat_htauk_day_din/utils/constants.dart';

// ignore: must_be_immutable
class NumberListScreen extends StatefulWidget {
  List<dynamic> numList = [];
  List<dynamic> loadedAns = [];
  String ques;
  int qNum;
  NumberListScreen(
      {Key? key, required this.numList, required this.ques, required this.qNum})
      : super(key: key);

  @override
  State<NumberListScreen> createState() => _NumberListScreenState();
}

class _NumberListScreenState extends State<NumberListScreen> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    await Ans().loadJsonData();
    setState(() {
      widget.loadedAns = Ans.getAns();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          LatHtaukBayDin,
          style: TextStyle(color: primary, fontSize: 17),
        ),
        iconTheme: IconThemeData(color: primary),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.5),
            child: Text(
              widget.ques,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
              child: GridView.count(
                crossAxisCount: 5,
                children: List.generate(widget.numList.length, (index) {
                  return InkWell(
                    onTap: () {
                      List<dynamic> updatedNumList = List.from(widget.numList);

                      switch (widget.numList[index]) {
                        case "၁":
                          updatedNumList[index] = 1;

                        case "၂":
                          updatedNumList[index] = 2;

                        case "၃":
                          updatedNumList[index] = 3;

                        case "၄":
                          updatedNumList[index] = 4;

                        case "၅":
                          updatedNumList[index] = 5;

                        case "၆":
                          updatedNumList[index] = 6;

                        case "၇":
                          updatedNumList[index] = 7;

                        case "၈":
                          updatedNumList[index] = 8;

                        case "၉":
                          updatedNumList[index] = 9;

                        case "၁၀":
                          updatedNumList[index] = 10;
                      }

                      setState(
                        () {
                          for (int i = 0; i < widget.loadedAns.length; i++) {
                            if ((widget.loadedAns[i]["questionNo"] ==
                                    widget.qNum) &
                                (widget.loadedAns[i]["answerNo"] ==
                                    updatedNumList[index])) {
                              showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor: Colors.white,
                                  builder: (BuildContext context) {
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 100,
                                          height: 100,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            child: Image.asset(
                                              mintheinkhaImgPath,
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 10,),
                                        Center(child: Text(LatHtaukBayDin,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w700),)),
                                        const SizedBox(height: 20,),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 15.0),
                                          child: Center(
                                            child: Text(
                                              widget.loadedAns[i]
                                                  ["answerResult"],
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const HomeScreen()));
                                            },
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(primary),
                                                foregroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(Colors.white),
                                                elevation:
                                                    MaterialStateProperty.all(
                                                        0),
                                                shape: MaterialStateProperty.all(
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                30)))),
                                            child: const Padding(
                                              padding: EdgeInsets.all(5.0),
                                              child: Text(
                                                "နောက်သို့",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ))
                                      ],
                                    );
                                  });
                              break;
                            }
                          }
                        },
                      );
                    },
                    child: Card(
                      color: primary,
                      elevation: 0,
                      margin: const EdgeInsets.all(5),
                      child: Center(
                        child: Text(
                          widget.numList[index].toString(),
                          style: const TextStyle(fontSize: 13, color: Colors.white),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

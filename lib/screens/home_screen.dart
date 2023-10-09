import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lat_htauk_day_din/core/view_models/numList_view_model.dart';
import 'package:lat_htauk_day_din/screens/numberList_screen.dart';
import 'package:lat_htauk_day_din/utils/colors.dart';
import 'package:lat_htauk_day_din/utils/constants.dart';
import 'package:lat_htauk_day_din/widgets/home_screen_que_list.dart';

import '../core/view_models/qus_view_model.dart';

List<dynamic> loadedQues = [];

List<dynamic> foundQues = [];

List<dynamic> loadedNumList = [];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    await Ques().loadJsonData();
    await NumList().loadJsonData();
    setState(() {
      loadedQues = Ques.getQues();
      foundQues = loadedQues;
      loadedNumList = NumList.getNumList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: foundQues.length,
                separatorBuilder: (context, i) {
                  return const Divider(
                    color: Colors.grey,
                    height: 2,
                  );
                },
                itemBuilder: (context, i) {
                  return ListTile(
                    title: QueListWidget(
                      qNo: foundQues[i]['questionNo'].toString(),
                      ques: foundQues[i]['questionName'],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NumberListScreen(
                            numList: loadedNumList,
                            ques: foundQues[i]["questionName"],
                            qNum: foundQues[i]["questionNo"],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 160,
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 55,
                height: 55,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    mintheinkhaImgPath,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                LatHtaukBayDin,
                style: TextStyle(color: primary, fontSize: 17),
              )
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          _buildSearchBox(context)
        ],
      ),
    );
  }

  SizedBox _buildSearchBox(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 1,
      height: 50,
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: primary,
              width: 2,
            ),
          ),
          contentPadding: const EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: primary,
          ),
          hintText: "Search",
        ),
      ),
    );
  }

  void _runFilter(String enteredKeyword) {
    List<dynamic> results = [];

    if (enteredKeyword.isEmpty) {
      setState(() {
        results = loadedQues;
      });
    } else {
      results = loadedQues
          .where((element) => element
              .toString()
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      foundQues = results;
    });
  }
}

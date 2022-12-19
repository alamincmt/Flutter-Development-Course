import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SuraList extends StatefulWidget {
  const SuraList({Key? key}) : super(key: key);

  @override
  State<SuraList> createState() => _SuraListState();
}

class _SuraListState extends State<SuraList> {

  Map? mainResponse;
  List? suraData;

  Future getData() async {
    http.Response response = await http.get(Uri.http("api.alquran.cloud", "/v1/surah"));
    mainResponse = json.decode(response.body);
    setState(() {
      suraData = mainResponse!["data"];
    });
  }

  @override
  void initState() {
    super.initState();
    print("initState() called");
    getData();
  }


  @override
  void didChangeDependencies() {
    print("didChangeDependencies() called");
  }


  @override
  bool get mounted {
    print("mounted() called");
    return true;
  }

  @override
  void deactivate() {
    print("deactivate() called");

  }

  @override
  void dispose() {
    print("dispose() called");

  }

  @override
  void activate() {
    print("activate() called");
  }


  @override
  void reassemble() {
    print("reassemble() called");
  }

  @override
  Widget build(BuildContext context) {
    print("build() called");

    return Scaffold(
      appBar: AppBar(
        title: Text("Al-Quran Sura List"),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: suraData == null ? 0 : suraData!.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage('https://reqres.in/img/faces/1-image.jpg'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("${suraData![index]["englishName"]} ${suraData![index]["englishNameTranslation"]}",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      ),),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

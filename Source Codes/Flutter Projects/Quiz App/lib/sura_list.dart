import 'package:flutter/material.dart';
import 'package:quiz_app/api/APIService.dart';

import 'model/sura_data.dart';

class SuraList extends StatefulWidget {
  const SuraList({Key? key}) : super(key: key);

  @override
  State<SuraList> createState() => _SuraListState();
}

class _SuraListState extends State<SuraList> {

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<List<SuraData>> getSuraList(){
    APIService apiService = new APIService();
    return apiService.suraList();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/login.png'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 35, top: 110),
              child: Text(
                'Welcome\nto Al-Quran Sura List',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: MediaQuery.of(context).size.height * 0.5,
                ),
                child: FutureBuilder(
                  future: getSuraList(),
                  builder: (BuildContext ctx, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return Container(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (ctx, index) => ListTile(
                          title: Text(snapshot.data[index].namne),
                          subtitle: Text(snapshot.data[index].numberOfAyahs),
                          contentPadding: EdgeInsets.only(bottom: 20.0),
                        ),
                      );
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

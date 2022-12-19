import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {

  Map? data;
  List? userData;

  Future getData() async {
    http.Response response = await http.get(Uri.https("reqres.in", "/api/users?page=1"));
    data = json.decode(response.body);
    setState(() {
      userData = data!["data"];
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Fake Friends"),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: userData == null ? 0 : userData!.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(userData![index]["pantone_value"]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("${userData![index]["name"]} ${userData![index]["year"]}",
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

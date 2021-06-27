import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'detailuser.dart';

class User extends StatefulWidget {

  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  Future<List> ambilUser() async {
    var data =
    await http.get(Uri.parse("http://192.168.43.191/tokoku/ambiluser.php"));
    var jsonData = json.decode(data.body);
    return jsonData;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Data User'),
      ),
      body: Container(
        child: FutureBuilder(
          future: ambilUser(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: Text("Loading..."),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return new Container(
                    padding: const EdgeInsets.all(10.0),
                    child: new GestureDetector(
                      onTap: () => Navigator.of(context).push(
                          new MaterialPageRoute(
                              builder: (BuildContext context) =>
                              new detailUser(
                                list: snapshot.data,
                                index: index,
                              ))),
                      child: new Card(
                        child: new ListTile(
                          title: new Text(snapshot.data[index]['nama']),
                          leading: Icon(
                            Icons.people
                          ),
                          subtitle:
                          new Text("alamat: " + snapshot.data[index]['alamat']),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

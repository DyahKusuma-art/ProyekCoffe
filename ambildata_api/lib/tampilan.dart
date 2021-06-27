import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'detailHalaman.dart';
import 'addData.dart';
import 'user.dart';


class Tampilan extends StatefulWidget {
  @override
  _TampilanState createState() => _TampilanState();
}

class _TampilanState extends State<Tampilan> {
  Future<List> ambilData() async {
    var data =
    await http.get(Uri.parse("http://192.168.43.191/tokoku/ambildata.php"));
    var jsonData = json.decode(data.body);
    return jsonData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LIST COFFEE"),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new User()));
          }, icon: Icon(Icons.people))
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) => new addData())),
        child: new Icon(Icons.add),
      ),

      body: Container(
        child: FutureBuilder(
          future: ambilData(),
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
                              new detailHalaman(
                                list: snapshot.data,
                                index: index,
                              ))),
                      child: new Card(
                        child: new ListTile(
                          title: new Text(snapshot.data[index]['nama']),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(snapshot.data[index]['gambar']),
                            radius: 35,
                          ),
                          subtitle:
                          new Text("stok: " + snapshot.data[index]['stok']),
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

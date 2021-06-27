import 'package:ambildata_api/detailBarang.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'keranjang.dart';

class Belanja extends StatefulWidget {

  @override
  _BelanjaState createState() => _BelanjaState();
}

class _BelanjaState extends State<Belanja> {
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
        title: Text(
          'LIST PRODUK COFFE YAHH',
          style: TextStyle(),

        ),
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
                    padding: const EdgeInsets.all(20.0),
                    child: new GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) => new detailBarang(
                                  list: snapshot.data,
                                  index: index,
                                )));
                      },
                      child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 250,
                              height: 250,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                  width: 1,
                                  color: Colors.grey,
                                ),
                              ),
                              margin: EdgeInsets.only(left: 50),
                              child: Stack(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 0,
                                      horizontal: 0,
                                    ),
                                    child: Center(
                                      child: Image(
                                        image: NetworkImage(
                                            snapshot.data[index]['gambar']),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(20, 5,20,0),
                                decoration: BoxDecoration(
                                  color: Colors.indigo[200],
                                  borderRadius: BorderRadius.circular(19),
                                ),
                                child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(top:10),
                                  child: Text(
                                    "Harga: " + snapshot.data[index]['harga'],
                                    style: TextStyle(
                                        fontSize: 20, letterSpacing: 1),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 40),
                                  child: ListTile(
                                    title: Text(snapshot.data[index]['nama'],style: TextStyle(
                                      fontSize: 20
                                    ),),
                                    subtitle: Text(
                                        "stok: " + snapshot.data[index]['stok']),
                                    leading: Icon(Icons.coffee),
                                  ),
                                ),
                              ],
                            )),

                          ]),
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

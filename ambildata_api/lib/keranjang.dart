import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Keranjang extends StatefulWidget {
  @override
  _KeranjangState createState() => _KeranjangState();
}

class _KeranjangState extends State<Keranjang> {
  Future<List> ambilKeranjang() async {
    var data =
    await http.get(Uri.parse("http://192.168.43.191/tokoku/keranjang.php"));
    var jsonData = json.decode(data.body);
    return jsonData;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: new Icon(Icons.arrow_back_ios),
        title: Text('Keranjang Belanja'),
      ),
      body: Container(
        child: FutureBuilder(
            future: ambilKeranjang(),
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
                        onTap: () {},
                        child: new Card(
                            child: new Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: [
                                      SizedBox(
                                          width: MediaQuery.of(context).size.width *
                                              0.15,
                                          child: AspectRatio(
                                            aspectRatio: 0.78,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white60,
                                                borderRadius:
                                                BorderRadius.circular(15),
                                              ),
                                              child: new Image.network(
                                                  snapshot.data[index]['gambar']),
                                            ),
                                          )),
                                      SizedBox(
                                          width: MediaQuery.of(context).size.width *
                                              0.05),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                  padding:
                                                  EdgeInsets.only(top: 15)),
                                              Text(
                                                snapshot.data[index]['nama'],
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500),
                                                maxLines: 2,
                                              ),
                                              Padding(
                                                  padding:
                                                  EdgeInsets.only(top: 5.0)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    thickness: 2,
                                  ),
                                  IntrinsicHeight(
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              snapshot.data[index]['jumlah'] +
                                                  " produk",
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              "Total pesanan: " +
                                                  snapshot.data[index]['harga'],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )),
                      ),
                    );
                  },
                );
              }
            }),
      ),
    );
  }
}

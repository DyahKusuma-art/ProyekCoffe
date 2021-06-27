import 'package:ambildata_api/tampilan.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';
import 'dart:async';

class hapusData extends StatefulWidget {
  List list;
  int index;
  hapusData({required this.list, required this.index});

  @override
  _hapusDataState createState() => _hapusDataState();
}

class _hapusDataState extends State<hapusData> {
  void hapusData() {
    http.post(Uri.parse("http://192.168.43.191/tokoku/hapusdata.php"), body: {
      "id": widget.list[widget.index]['id'],
    });
  }

  final scaffoldState = GlobalKey<ScaffoldState>();

  void showSnakeBar(scaffoldState, String _pesan) {
    scaffoldState.currentState.showSnackBar(
      new SnackBar(
        content: Text(_pesan),
        action: SnackBarAction(
          label: 'Close',
          onPressed: () {
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => Tampilan()));
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Konfirmasi"),
      ),
      key: scaffoldState,
      body: new Container(
        color: Colors.black45,
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(20.0),
        child: new ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new Container(
                  padding: EdgeInsets.all(20),
                  child: new Card(
                    child: new Image(
                      image: NetworkImage(widget.list[widget.index]['gambar']),
                    ),
                    elevation: 5,
                  ),
                  height: 280,
                  width: double.maxFinite,
                ),
                new Text(
                  "Nama Barang:",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                new Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                  height: 60,
                  width: double.maxFinite,
                  child: Card(
                    child: new Center(
                      child: new Text(widget.list[widget.index]['nama']),
                    ),
                    elevation: 5,
                  ),
                ),
                new Text(
                  "Kode Barang:",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                new Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                  height: 60,
                  width: double.maxFinite,
                  child: Card(
                    child: Center(
                        child: new Text(widget.list[widget.index]['kode'])),
                    elevation: 5,
                  ),
                ),
                new Text(
                  "Harga Barang:",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                new Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                  height: 60,
                  width: double.maxFinite,
                  child: Card(
                    child: Center(
                      child: Text(widget.list[widget.index]['harga']),
                    ),
                    elevation: 5,
                  ),
                ),
                new Text(
                  "Stok Barang:",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                new Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                  height: 60,
                  width: double.maxFinite,
                  child: Card(
                    child: new Center(
                      child: new Text(widget.list[widget.index]['stok']),
                    ),
                    elevation: 5,
                  ),
                ),
                new Container(
                  child: new Center(
                      child: new Text(
                    "Apakah anda yakin untuk menghapus data berikut?",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  )),
                ),
                new ElevatedButton(
                  onPressed: () {
                    hapusData();
                    showSnakeBar(scaffoldState, 'DATA BERHASIL TERHAPUS');
                    new Timer(const Duration(seconds: 1), () {
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => new Tampilan()));
                    });
                  },
                  child: new Text("Hapus"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

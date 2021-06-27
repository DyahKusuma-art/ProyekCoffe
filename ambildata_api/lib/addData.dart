import 'package:ambildata_api/tampilan.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';
import 'dart:async';

class addData extends StatefulWidget {
  @override
  _addDataState createState() => _addDataState();
}

class _addDataState extends State<addData> {
  TextEditingController controllerKode = new TextEditingController();
  TextEditingController controllerNama = new TextEditingController();
  TextEditingController controllerHarga = new TextEditingController();
  TextEditingController controllerStok = new TextEditingController();
  TextEditingController controllerGambar = new TextEditingController();

  void simpanData(){
    http.post(Uri.parse("http://192.168.43.191/tokoku/adddata.php"),
    body: {
      "kodeBarang": controllerKode.text,
      "namaBarang": controllerNama.text,
      "hargaBarang": controllerHarga.text,
      "stokBarang": controllerStok.text,
      "gambarBarang": controllerGambar.text,
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
                builder: (BuildContext context) => new MyHomePage()));
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Menambah Data"),
      ),
      key: scaffoldState,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: new ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerKode,
                  decoration: new InputDecoration(
                    hintText: "kode barang",
                    labelText: "kode barang",
                  ),
                ),
                new TextField(
                  controller: controllerNama,
                  decoration: new InputDecoration(
                    hintText: "nama barang",
                    labelText: "nama barang",
                  ),
                ),
                new TextField(
                  controller: controllerHarga,
                  decoration: new InputDecoration(
                    hintText: "harga barang",
                    labelText: "harga barang",
                  ),
                ),
                new TextField(
                  controller: controllerStok,
                  decoration: new InputDecoration(
                    hintText: "stok barang",
                    labelText: "stok barang",
                  ),
                ),
                new TextField(
                  controller: controllerGambar,
                  decoration: new InputDecoration(
                    hintText: "Gambar Barang",
                    labelText: "Link Gambar Barang",
                  ),
                ),
                new Padding(padding: const EdgeInsets.all(10.0)),
                new ElevatedButton(
                  onPressed: () {
                    simpanData();
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => new Tampilan()));
                  },
                  child: new Text("simpan"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

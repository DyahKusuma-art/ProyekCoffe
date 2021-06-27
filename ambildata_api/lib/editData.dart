import 'package:ambildata_api/tampilan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';
import 'dart:async';

class editData extends StatefulWidget {
  List list;
  int index;
  editData({required this.list, required this.index});

  @override
  _editDataState createState() => _editDataState();
}

class _editDataState extends State<editData> {
  TextEditingController controllerKode = new TextEditingController();
  TextEditingController controllerNama = new TextEditingController();
  TextEditingController controllerHarga = new TextEditingController();
  TextEditingController controllerStok = new TextEditingController();
  TextEditingController controllerGambar = new TextEditingController();

  @override
  void initState() {
    controllerKode.text = widget.list[widget.index]['kode'];
    controllerNama.text = widget.list[widget.index]['nama'];
    controllerHarga.text = widget.list[widget.index]['harga'];
    controllerStok.text = widget.list[widget.index]['stok'];
    controllerGambar.text = widget.list[widget.index]['gambar'];
    super.initState();
  }

  void editData() {
    http.post(Uri.parse("http://192.168.43.191/tokoku/editdata.php"), body: {
      "kodeBarang": controllerKode.text,
      "namaBarang": controllerNama.text,
      "hargaBarang": controllerHarga.text,
      "stokBarang": controllerStok.text,
      "gambarBarang": controllerGambar.text,
      "id": widget.list[widget.index]['id'],
    });
  }
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

  final scaffoldState = GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Edit Data"),
      ),key: scaffoldState,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: new ListView(
          children: <Widget>[
            SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: TextField(
                    controller: controllerKode,
                    decoration: new InputDecoration(
                      hintText: "kode barang",
                      labelText: "kode barang",
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: TextField(
                    controller: controllerNama,
                    decoration: new InputDecoration(
                      hintText: "nama barang",
                      labelText: "nama barang",
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: TextField(
                    controller: controllerStok,
                    decoration: new InputDecoration(
                      hintText: "stok barang",
                      labelText: "stok barang",
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: TextField(
                    controller: controllerGambar,
                    decoration: new InputDecoration(
                      hintText: "Gambar Barang",
                      labelText: "Link Gambar Barang",
                    ),
                  ),
                ),
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
                new Padding(padding: const EdgeInsets.all(10.0)),
                new ElevatedButton(
                  onPressed: () {
                    editData();
                    showSnakeBar(scaffoldState, 'DATA BERHASIL DIEDIT', );
                    new Timer(const Duration(seconds: 1), () {
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => new Tampilan()));
                    });
                  },
                  child: new Text("edit"),
                ),
              ],
            ),
            ),
          ],
        ),
      ),
    );
  }
}


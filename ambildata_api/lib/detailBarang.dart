import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'editData.dart';
import 'hapusData.dart';
import 'keranjang.dart';

class detailBarang extends StatefulWidget {
  List list;
  int index;
  detailBarang({required this.list, required this.index});

  @override
  _detailBarangState createState() => _detailBarangState();
}

class _detailBarangState extends State<detailBarang> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(widget.list[widget.index]['nama']),
      ),
      body: new Container(
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new ListTile(
                  title: new Text(widget.list[widget.index]['nama']),
                  subtitle: Text("Nama Barang"),
                  leading: Icon(Icons.widgets),
                ),
                new ListTile(
                  title: new Text(widget.list[widget.index]['harga']),
                  subtitle: Text("Harga Barang"),
                  leading: Icon(Icons.price_check),
                ),
                new ListTile(
                  title: new Text(widget.list[widget.index]['stok']),
                  subtitle: Text("Stok Barang"),
                  leading: Icon(Icons.shopping_cart),
                ),
                new Container(
                  padding: EdgeInsets.all(0),
                  child: new Card(
                    child: new Image(
                      image: NetworkImage(widget.list[widget.index]['gambar']),
                    ),
                    elevation: 5,
                  ),
                  height: 200,
                  width: double.maxFinite,
                ),
                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Container(
                      child: Center(
                        child: new ElevatedButton(

                          onPressed: () => Navigator.of(context).push(
                              new MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      new Keranjang(
                                      ))),
                          child: new Text("tambah"),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

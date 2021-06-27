import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'editData.dart';
import 'hapusData.dart';

class detailHalaman extends StatefulWidget {
  List list;
  int index;
  detailHalaman({required this.list, required this.index});

  @override
  _detailHalamanState createState() => _detailHalamanState();
}

class _detailHalamanState extends State<detailHalaman> {
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
                title: new Text(widget.list[widget.index]['kode']),
                subtitle: Text("Kode Barang"),
                leading: Icon(Icons.qr_code),
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
                    padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                    child: new ElevatedButton(
                        onPressed: () =>
                            Navigator.of(context).push(new MaterialPageRoute(
                                builder: (BuildContext context) => new editData(
                                  list: widget.list,
                                  index: widget.index,
                                ))),
                        child: new Text("Edit")),
                  ),
                  new Container(
                    child: new ElevatedButton(
                      onPressed: () =>
                          Navigator.of(context).push(new MaterialPageRoute(
                              builder: (BuildContext context) => new hapusData(
                                list: widget.list,
                                index: widget.index,
                              ))),
                      child: new Text("Hapus"),
                    ),
                  ),
                ],
              ),
            ],
          ),),
        ),
      ),
    );
  }
}

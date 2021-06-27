import 'package:ambildata_api/hapususer.dart';
import 'package:ambildata_api/user.dart';
import 'package:flutter/material.dart';
import 'editUser.dart';
import 'user.dart';
import 'dart:async';
import 'hapususer.dart';
import 'package:http/http.dart' as http;

class detailUser extends StatefulWidget {
  List list;
  int index;
  detailUser({required this.list, required this.index});

  @override
  _detailUserState createState() => _detailUserState();
}

class _detailUserState extends State<detailUser> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail User'),
      ),
      body: Container(
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new ListTile(
                  title: new Text(widget.list[widget.index]['nama']),
                  subtitle: Text("Nama User"),
                  leading: Icon(Icons.widgets),
                ),
                new ListTile(
                  title: new Text(widget.list[widget.index]['alamat']),
                  subtitle: Text("Alamat User"),
                  leading: Icon(Icons.price_check),
                ),
                new ListTile(
                  title: new Text(widget.list[widget.index]['email']),
                  subtitle: Text("email"),
                  leading: Icon(Icons.shopping_cart),
                ),
                new ListTile(
                  title: new Text(widget.list[widget.index]['sandi']),
                  subtitle: Text("pasword"),
                  leading: Icon(Icons.shopping_cart),
                ),
                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Container(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: new ElevatedButton(
                          onPressed: () => Navigator.of(context).push(
                              new MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      new editUser(
                                        list: widget.list,
                                        index: widget.index,
                                      ))),
                          child: new Text("Edit")),
                    ),
                    new Container(
                      child: new ElevatedButton(
                        onPressed: () {
                          new Timer(const Duration(seconds: 1), () {
                            Navigator.of(context).push(new MaterialPageRoute(
                                builder: (BuildContext context) => new hapusUser(
                              list: widget.list,
                              index: widget.index,
                            )));

                          });
                        },

                        child: new Text("Hapus"),
                      ),
                    ),
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

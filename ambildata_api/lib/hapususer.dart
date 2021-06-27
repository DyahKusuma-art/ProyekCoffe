import 'package:ambildata_api/tampilan.dart';
import 'package:ambildata_api/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';
import 'dart:async';
import 'user.dart';

class hapusUser extends StatefulWidget {
  List list;
  int index;
  hapusUser({required this.list, required this.index});

  @override
  _hapusUserState createState() => _hapusUserState();
}

class _hapusUserState extends State<hapusUser> {
  void hapusUser() {
    http.post(Uri.parse("http://192.168.43.191/tokoku/hapususer.php"), body: {
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
                builder: (BuildContext context) => User()));
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
                new Text(
                  "Nama User:",
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
                  "Alamat user",
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
                        child: new Text(widget.list[widget.index]['alamat'])),
                    elevation: 5,
                  ),
                ),
                new Text(
                  "email:",
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
                      child: Text(widget.list[widget.index]['email']),
                    ),
                    elevation: 5,
                  ),
                ),
                new Text(
                  "Password:",
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
                      child: new Text(widget.list[widget.index]['sandi']),
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
                    hapusUser();
                    showSnakeBar(scaffoldState, 'DATA BERHASIL TERHAPUS');
                    new Timer(const Duration(seconds: 1), () {
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => new User()));
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

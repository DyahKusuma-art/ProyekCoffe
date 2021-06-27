import 'package:ambildata_api/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'user.dart';

class editUser extends StatefulWidget {
  List list;
  int index;
  editUser({required this.list, required this.index});
  @override
  _editUserState createState() => _editUserState();
}

class _editUserState extends State<editUser> {
  TextEditingController controllerNama = new TextEditingController();
  TextEditingController controllerAlamat = new TextEditingController();
  TextEditingController controllerEmail = new TextEditingController();
  TextEditingController controllerSandi = new TextEditingController();


  @override
  void initState() {
    controllerNama.text = widget.list[widget.index]['nama'];
    controllerAlamat.text = widget.list[widget.index]['alamat'];
    controllerEmail.text = widget.list[widget.index]['email'];
    controllerSandi.text = widget.list[widget.index]['sandi'];
    super.initState();
  }
  void editUser() {
    http.post(Uri.parse("http://192.168.43.191/tokoku/edituser.php"), body: {
      "namaUser": controllerNama.text,
      "alamatUser": controllerAlamat.text,
      "emailUser": controllerEmail.text,
      "sandiUser": controllerSandi.text,
      "id": widget.list[widget.index]['id'],
    });
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Edit Data"),
      ),
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
                      controller: controllerNama,
                      decoration: new InputDecoration(
                        hintText: "nama User",
                        labelText: "nama User",
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
                      controller: controllerAlamat,
                      decoration: new InputDecoration(
                        hintText: "Alamat user",
                        labelText: "Alamat User",
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
                      controller: controllerEmail,
                      decoration: new InputDecoration(
                        hintText: "Email",
                        labelText: "Email",
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
                      controller: controllerSandi,
                      decoration: new InputDecoration(
                        hintText: "Password",
                        labelText: "Password",
                      ),
                    ),
                  ),
                  new Padding(padding: const EdgeInsets.all(10.0)),
                  new ElevatedButton(
                    onPressed: () {
                      editUser();
                      new Timer(const Duration(seconds: 1), () {
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) => new User()));
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

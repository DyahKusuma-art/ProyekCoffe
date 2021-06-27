import 'dart:async';

import 'package:flutter/material.dart';
import 'login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'main.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController controllerEmail = new TextEditingController();
  TextEditingController controllerSandi = new TextEditingController();
  TextEditingController controllerNama = new TextEditingController();
  TextEditingController controllerAlamat = new TextEditingController();

  Future register() async {
    var url = Uri.parse("http://192.168.43.191/tokoku/register.php");
    var response = await http.post(url, body: {
      "email": controllerEmail.text,
      "sandi": controllerSandi.text,
      "nama": controllerNama.text,
      "alamat": controllerAlamat.text,

    });
    var data = json.decode(response.body);
    if (data == "Gagal") {
      Fluttertoast.showToast(
          msg: "Email Sudah Digunakan",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      new Timer(const Duration(seconds: 1), () {
        Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) => new Register()));
      });
    } else {
      Fluttertoast.showToast(
          msg: "Registration sukses",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      new Timer(const Duration(seconds: 1), () {
        Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) => new Login()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "SIGNUP",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              Image(
                image: AssetImage('assets/images/out.png'),
                height: size.height * 0.20,
              ),
              SizedBox(height: size.height * 0.03),
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
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.drive_file_rename_outline,
                      color: Colors.indigo,
                    ),
                    hintText: "Nama Anda",
                    border: InputBorder.none,
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
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.home,
                      color: Colors.indigo,
                    ),
                    hintText: "Alamat",
                    border: InputBorder.none,
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
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.email,
                      color: Colors.indigo,
                    ),
                    hintText: "Email",
                    border: InputBorder.none,
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
                  obscureText: true,
                  controller: controllerSandi,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.password,
                      color: Colors.indigo,
                    ),
                    hintText: "Password",
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: size.width * 0.8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: MaterialButton(
                    color: Colors.indigo,
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                    onPressed: () {
                      register();
                    },
                    child: Text(
                      "SIGNUP",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Have Account? ",
                    style: TextStyle(
                      color: Colors.indigo,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(
                        new MaterialPageRoute(
                            builder: (BuildContext context) => new Login())),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.indigo,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

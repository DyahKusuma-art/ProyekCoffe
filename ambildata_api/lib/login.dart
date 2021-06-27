import 'dart:async';
import 'package:ambildata_api/belanja.dart';
import 'package:flutter/material.dart';
import 'register.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'main.dart';
import 'tampilan.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController controllerEmail = new TextEditingController();
  TextEditingController controllerSandi = new TextEditingController();

  Future login() async {
    var url = Uri.parse("http://192.168.43.191/tokoku/login.php");
    var response = await http.post(url, body: {
      "email": controllerEmail.text,
      "sandi": controllerSandi.text,
    });
    var data = json.decode(response.body);
    if (data == "gagal") {
      Fluttertoast.showToast(
          msg: "Gagal Login, Periksa Inputan anda",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }else {
      Fluttertoast.showToast(
          msg: "Berhasil login",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      new Timer(const Duration(seconds: 1), () {
        Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) => new Belanja(
            )));
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
                "LOGIN",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              Image(
                image: AssetImage('assets/images/kk.png'),
                height: size.height * 0.40,
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
                  controller: controllerEmail,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.email,
                      color: Colors.indigo,
                    ),
                    hintText: "Your Email",
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
                      login();
                    },
                    child: Text(
                      "LOGIN",
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
                    "dont have account? ",
                    style: TextStyle(
                      color: Colors.indigo,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(
                        new MaterialPageRoute(
                            builder: (BuildContext context) => new Register())),
                    child: Text(
                      "Sign Up",
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

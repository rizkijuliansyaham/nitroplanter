import 'dart:convert';

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:nitroplanter/pages/home.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Montserrat'),
      title: "App",
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late String userId = '';
  late String token = '';
  late String text = '';
  late String loginCondition = 'login';
  final TextEditingController _emailFilter = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();
  final TextEditingController _verifpasswordFilter =
      new TextEditingController();

  String urlMaster =
      "https://nitroplanter-62950-default-rtdb.asia-southeast1.firebasedatabase.app/";

  Future<String> login() async {
    return 'login';
  }

  getDataLogin() async {
    Uri urlget =
        Uri.parse("$urlMaster/plant_controller/$userId.json?auth=$token");
    var response = await http.get(urlget);
    var mantap = jsonDecode(response.body);
    print(mantap);
    // print(token);
    // ignore: unnecessary_null_comparison
    if (mantap == null && token != '' && userId != '') {
      for (int i = 0; i < 3; i++) {
        Uri url =
            Uri.parse("$urlMaster/plant_controller/$userId.json?auth=$token");
        // ignore: unnecessary_null_comparison
        await http.post(
          url,
          body: json.encode({
            "plant": "",
            "schedule": "1 x Sehari",
            "water_amount": 0,
            "humidity": 0,
          }),
        );
      }
      await http.post(
        Uri.parse(
            'https://nitroplanter-62950-default-rtdb.asia-southeast1.firebasedatabase.app/temperature/' +
                userId +
                '.json?auth=' +
                token),
        body: json.encode({
          "temp": 0,
        }),
      );
    }
  }

  cobalogin() async {
    Uri url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyBI-drA3sxmx_QKSNd_GR2SoTvX3k_AZrs");

    try {
      var response = await http.post(
        url,
        body: json.encode({
          // "email": "barry.allen@example.com",
          // "password": "SuperSecretPassword!",
          // "returnSecureToken": true,
          "email": _emailFilter.text,
          "password": _passwordFilter.text,
          "returnSecureToken": true,
        }),
      );
      var responseData = json.decode(response.body);
      token = responseData['idToken'];
      userId = responseData['localId'];

      if (responseData['error'] != null) {
        throw responseData['error']["message"];
      }
    } catch (error) {
      print('error');
    }
    // print(token);
    if (token == '') {
      setState(() {
        text = 'Maaf, email atau password salah';
      });
    }
    // print(userId);
    getDataLogin();
    if (token != '') {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => MainMenu(
                    token: token,
                    userId: userId,
                  )));
    }
    // Navigator.push(context,
    //     PageTransition(type: PageTransitionType.fade, child: ScheduleMenu()));
    return token;

    // print(userId);
    // navigator();
  }

  cobadaftar() async {
    Uri url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBI-drA3sxmx_QKSNd_GR2SoTvX3k_AZrs");

    try {
      var response = await http.post(
        url,
        body: json.encode({
          "email": _emailFilter.text,
          "password": _passwordFilter.text,
          "returnSecureToken": true,
        }),
      );
      var responseData = json.decode(response.body);
      token = responseData['idToken'];
      userId = responseData['localId'];

      if (responseData['error'] != null) {
        throw responseData['error']["message"];
      }
    } catch (error) {
      print('error');
    }
    // print(token);
    // if (token == '') {
    //   setState(() {
    //     text = 'Maaf, email atau password salah';
    //   });
    // }
    // print(userId);
    getDataLogin();
    if (token != '') {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => MainMenu(
                    token: token,
                    userId: userId,
                  )));
    }
    // Navigator.push(context,
    //     PageTransition(type: PageTransitionType.fade, child: ScheduleMenu()));
    return token;

    // print(userId);
    // navigator();
  }

  coba() {
    print('object');
  }

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Welcome to Flutter',
    //   theme: ThemeData(fontFamily: 'Montserrat'),
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Welcome to Flutter'),
      // ),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder(
                  future: login(),
                  builder: (context, snapshot) {
                    // print(snapshot.data);
                    // print(token);
                    // print(loginCondition);

                    return Column(
                      children: [
                        text != '' && loginCondition == "login"
                            ? Text(
                                text,
                                style: TextStyle(color: Colors.red),
                              )
                            : SizedBox(),
                        text != '' && loginCondition == 'register'
                            ? Center(
                                child: Text(
                                  text,
                                  style: TextStyle(color: Colors.red),
                                ),
                              )
                            : SizedBox(),
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 40),
                          child: TextField(
                            controller: _emailFilter,
                            decoration: new InputDecoration(labelText: 'Email'),
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 40),
                          child: TextField(
                              controller: _passwordFilter,
                              decoration:
                                  new InputDecoration(labelText: 'Password'),
                              obscureText: true),
                        ),
                        loginCondition == "register"
                            ? Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 40),
                                child: TextField(
                                    controller: _verifpasswordFilter,
                                    decoration: new InputDecoration(
                                        labelText: 'Verify Password'),
                                    obscureText: true),
                              )
                            : SizedBox(),
                        SizedBox(height: 15),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              loginCondition == "login"
                                  ? ElevatedButton(
                                      onPressed: () {
                                        // print(token);
                                        setState(() {
                                          cobalogin();
                                        });
                                      },
                                      child: Text('Masuk'))
                                  : SizedBox(),
                              loginCondition == "login"
                                  ? SizedBox(
                                      width: 30,
                                    )
                                  : SizedBox(),
                              loginCondition == "login"
                                  ? ElevatedButton(
                                      onPressed: () {
                                        // print(token);
                                        setState(() {
                                          loginCondition = 'register';
                                          text = '';
                                          _passwordFilter.text = '';
                                          _emailFilter.text = '';
                                          _verifpasswordFilter.text = '';
                                          // cobadaftar();
                                          // print('object');
                                          // coba();

                                          // print(loginCondition);
                                        });
                                      },
                                      child: Text('Daftar'))
                                  : SizedBox(),
                              loginCondition == "register"
                                  ? ElevatedButton(
                                      onPressed: () {
                                        // print(token);
                                        setState(() {
                                          _passwordFilter.text == '' ||
                                                  _emailFilter.text == ''
                                              ? text =
                                                  'email atau password tidak boleh kosong'
                                              : text = text;
                                          _passwordFilter.text.length < 6 &&
                                                  _passwordFilter.text.length >
                                                      0
                                              ? text =
                                                  'Panjang password harus lebih dari 6'
                                              : text = text;
                                          _passwordFilter.text !=
                                                      _verifpasswordFilter
                                                          .text &&
                                                  _passwordFilter.text.length >
                                                      6
                                              ? text = 'password harus sama'
                                              : text = text;
                                          loginCondition = 'register';
                                          _passwordFilter.text.length > 6 &&
                                                  _passwordFilter.text ==
                                                      _verifpasswordFilter
                                                          .text &&
                                                  _emailFilter.text != ''
                                              ? cobadaftar()
                                              : text = text;
                                          // print('object');
                                          // coba();

                                          // print(loginCondition);
                                        });
                                      },
                                      child: Text('Daftar Akun'))
                                  : SizedBox(),
                            ],
                          ),
                        ),

                        //daftar ke authentikasi
                        loginCondition == "register"
                            ? ElevatedButton(
                                onPressed: () {
                                  // print(token);
                                  setState(() {
                                    loginCondition = 'login';
                                    text = '';
                                    _passwordFilter.text = '';
                                    _emailFilter.text = '';
                                    _verifpasswordFilter.text = '';
                                    // cobadaftar();
                                    // print('object');
                                    // coba();

                                    // print(loginCondition);
                                  });
                                },
                                child: Text('Back'))
                            : SizedBox(),
                      ],
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

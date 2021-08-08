import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class TemperatureComponent extends StatefulWidget {
  final String token;
  final String userId;
  const TemperatureComponent(
      {Key? key, required this.token, required this.userId})
      : super(key: key);

  @override
  _TemperatureComponentState createState() => _TemperatureComponentState();
}

class _TemperatureComponentState extends State<TemperatureComponent> {
  // late Future<List> _future;
  late Future<List> _futureTemperature;
  @override
  void initState() {
    // _future = getData();
    _futureTemperature = getTemperature();
    super.initState();
  }

  // postTemperature() async {
  //   await http.post(
  //     Uri.parse(
  //         'https://nitroplanterfirebase-default-rtdb.asia-southeast1.firebasedatabase.app/temperature/' +
  //             widget.userId +
  //             '.json?auth=' +
  //             widget.token),
  //     body: json.encode({
  //       "temp": 25,
  //     }),
  //   );
  // }

  Future<List> getTemperature() async {
    List dataFirebaseTemperature = [];
    final response = await http.get(Uri.parse(
        'https://nitroplanter-62950-default-rtdb.asia-southeast1.firebasedatabase.app/temperature/' +
            widget.userId +
            '.json?auth=' +
            widget.token));
    var result = jsonDecode(response.body) == null
        ? {
            "data": {"temp": 0}
          }
        : json.decode(response.body) as Map<String, dynamic>;
    result.forEach((id, value) {
      dataFirebaseTemperature.add(value);
    });
    print(dataFirebaseTemperature);
    return dataFirebaseTemperature;
  }

  // Future<List> getData() async {
  //   final response = await http.get(
  //       Uri.parse("http://192.168.43.7/nitroplanter/get_room_temperature.php"));
  //   if (response.statusCode == 200) {
  //     return json.decode(response.body);
  //   } else {
  //     throw Exception('Failed to load ');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List>(
          future: _futureTemperature,
          builder: (context, snapshot) {
            return snapshot.hasData
                ? Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Colors.grey.withAlpha(25),
                    ),
                    child: Row(
                      children: [
                        // ElevatedButton(
                        //     onPressed: () => postTemperature(),
                        //     child: Text('data')),
                        Expanded(
                          child: Image.asset(
                            "assets/images/thermo.png",
                            width: 50,
                            height: 50,
                          ),
                          flex: 1,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Suhu Ruangan',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ],
                                ),
                                flex: 1,
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Text(
                                      snapshot.hasData
                                          ? snapshot.data![0]['temp'].toString()
                                          : '0',
                                      style: TextStyle(
                                          color: Colors.redAccent,
                                          fontSize: 35,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      ' Celsius',
                                      style: TextStyle(
                                          fontSize: 35,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ],
                                ),
                                flex: 1,
                              ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                          flex: 3,
                        ),
                      ],
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          }),
    );
  }
}

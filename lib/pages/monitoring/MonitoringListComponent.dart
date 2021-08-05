import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MonitoringListComponent extends StatefulWidget {
  const MonitoringListComponent({Key? key}) : super(key: key);

  @override
  _MonitoringListComponentState createState() =>
      _MonitoringListComponentState();
}

class _MonitoringListComponentState extends State<MonitoringListComponent> {
  late Future<List> _future;
  @override
  void initState() {
    _future = getData();

    super.initState();
  }

  Future<List> getData() async {
    final response = await http
        .get(Uri.parse("http://192.168.43.7/nitroplanter/get_plant.php"));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load content');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
        future: _future,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, i) {
                    return Container(
                        child: Stack(
                      children: <Widget>[
                        Container(
                          height: 300,
                          margin: EdgeInsets.all(20),
                          padding: EdgeInsets.only(
                              top: 20, bottom: 20, left: 20, right: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17),
                            color: Colors.grey.withAlpha(30),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(width: 20), // give it width

                                  Text(
                                    'Tanaman ',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w900,
                                      color: Color.fromRGBO(78, 204, 111, 1),
                                    ),
                                  ),
                                  Text(
                                    (i + 1).toString(),
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w900,
                                      color: Color.fromRGBO(78, 204, 111, 1),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Tanaman ' + snapshot.data![i]['plant'],
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  )
                                ],
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Image.asset(
                                        "assets/images/schedule.png",
                                        width: 50,
                                        height: 50,
                                      ),
                                      flex: 1,
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Jadwal Penyiraman'),
                                            Text(
                                              snapshot.data![i]['schedule'],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 20),
                                            ),
                                          ]),
                                      flex: 4,
                                    ),
                                  ],
                                ),
                                flex: 1,
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Image.asset(
                                        "assets/images/water.png",
                                        width: 50,
                                        height: 50,
                                      ),
                                      flex: 1,
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Kelembapan Tanaman'),
                                            Row(
                                              children: [
                                                Text(
                                                  snapshot.data![i]
                                                          ['humidity'] +
                                                      "% " +
                                                      "(",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontSize: 20),
                                                ),
                                                Text(
                                                    int.parse(snapshot.data![i]
                                                                ['humidity']) <
                                                            40
                                                        ? 'Baik'
                                                        : 'Tidak Baik',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        fontSize: 20)),
                                                Text(
                                                  ")",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontSize: 20),
                                                ),
                                              ],
                                            )
                                          ]),
                                      flex: 4,
                                    ),
                                  ],
                                ),
                                flex: 1,
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 7, left: 28),
                          width: 75,
                          height: 75,
                          // color: Colors.blue,
                          child: Image.asset(
                            "assets/images/plant-box.png",
                            width: 50,
                            height: 50,
                          ),
                        ),
                      ],
                    ));
                  })
              : Center(child: CircularProgressIndicator());
        });
  }
}

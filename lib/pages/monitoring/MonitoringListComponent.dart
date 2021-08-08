import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MonitoringListComponent extends StatefulWidget {
  final String token;
  final String userId;
  final List idData;
  final List plant;
  final List humidity;
  final List waterAmount;
  final List schedule;
  const MonitoringListComponent({
    Key? key,
    required this.token,
    required this.userId,
    required this.plant,
    required this.humidity,
    required this.waterAmount,
    required this.schedule,
    required this.idData,
  }) : super(key: key);
  @override
  _MonitoringListComponentState createState() =>
      _MonitoringListComponentState();
}

class _MonitoringListComponentState extends State<MonitoringListComponent> {
  // late Future<List> _future;
  late Future<List> _future2;
  late List plant = [];
  late List waterAmount = [];
  late List humidity = [];
  late List schedule = [];
  late List idData = [];
  String urlMaster =
      "https://nitroplanterfirebase-default-rtdb.asia-southeast1.firebasedatabase.app/";
  @override
  void initState() {
    // _future = getData();
    _future2 = getDataFirebase();
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

  Future<List> getDataFirebase() async {
    List dataFirebase = [];
    Uri url = Uri.parse("$urlMaster/plant_controller/" +
        widget.userId +
        ".json?auth=" +
        widget.token);
    var response = await http.get(url);
    var mantap = jsonDecode(response.body) == null
        ? {}
        : jsonDecode(response.body) as Map<String, dynamic>;

    // ignore: unnecessary_null_comparison
    widget.token == null
        ? print('tidak ada token')
        : mantap.forEach((id, data) {
            // ignore: unnecessary_statements
            data['plant'] != null ? plant.add(data['plant']) : plant.add('');
            data['humidity'] != null
                ? humidity.add(data['humidity'])
                : plant.add('');
            data['schedule'] != null
                ? schedule.add(data['schedule'])
                : plant.add('');
            data['water_amount'] != null
                ? waterAmount.add(data['water_amount'])
                : plant.add('');
            // ignore: unnecessary_null_comparison
            id != null ? idData.add(id) : idData.add('');
            dataFirebase.add(data);
            // print(data);
          });
    // print(dataFirebase);
    return dataFirebase;

    // print(schedule);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
        future: _future2,
        builder: (context, snapshot) {
          // print(snapshot.data!);
          // print(snapshot.data!.length);

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
                                      fontFamily: 'Montserrat',
                                    ),
                                  ),
                                  Text(
                                    (i + 1).toString(),
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w900,
                                      color: Color.fromRGBO(78, 204, 111, 1),
                                      fontFamily: 'Montserrat',
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
                                      fontFamily: 'Montserrat',
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
                                            Text(
                                              'Jadwal Penyiraman',
                                              style: TextStyle(
                                                fontFamily: 'Montserrat',
                                              ),
                                            ),
                                            Text(
                                              // widget.schedule[i],
                                              snapshot.data![i]['schedule'],
                                              style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                fontSize: 20,
                                                fontFamily: 'Montserrat',
                                              ),
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
                                            Text(
                                              'Kelembapan Tanaman',
                                              style: TextStyle(
                                                fontFamily: 'Montserrat',
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  snapshot.data![i]['humidity']
                                                          .toString() +
                                                      "% " +
                                                      "(",
                                                  style: TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontSize: 20),
                                                ),
                                                Text(
                                                    snapshot.data![i]
                                                                ['humidity'] >
                                                            30
                                                        ? 'Baik'
                                                        : 'Tidak baik',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'Montserrat',
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        fontSize: 20)),
                                                Text(
                                                  ")",
                                                  style: TextStyle(
                                                      fontFamily: 'Montserrat',
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

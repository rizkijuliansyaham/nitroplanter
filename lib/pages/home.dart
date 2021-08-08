import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nitroplanter/pages/info/InfoCard.dart';
import 'package:nitroplanter/pages/monitoring/MonitoringCard.dart';
import 'package:nitroplanter/pages/schedule/ScheduleCard.dart';
import 'package:http/http.dart' as http;

class MainMenu extends StatefulWidget {
  final String token;
  final String userId;
  const MainMenu({Key? key, required this.token, required this.userId})
      : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  late List plant = [];
  late List waterAmount = [];
  late List humidity = [];
  late List schedule = [];
  late List idData = [];
  String urlMaster =
      "https://nitroplanterfirebase-default-rtdb.asia-southeast1.firebasedatabase.app/";

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
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
          });
    print(schedule);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Montserrat'),
      home: Scaffold(
        body: SafeArea(
            child: Column(
          children: [
            Expanded(
              child: SizedBox(),
              flex: 2,
            ),
            Expanded(
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ScheduleCard(
                    token: widget.token,
                    userId: widget.userId,
                    plant: plant,
                    waterAmount: waterAmount,
                    schedule: schedule,
                    humidity: humidity,
                    idData: idData,
                  ),
                  MonitoringCard(
                    token: widget.token,
                    userId: widget.userId,
                    plant: plant,
                    waterAmount: waterAmount,
                    schedule: schedule,
                    humidity: humidity,
                    idData: idData,
                  ),
                  InfoCard(),
                ],
              )),
              flex: 10,
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: Text(
                  'Nitro Planter',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 25,
                  ),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}

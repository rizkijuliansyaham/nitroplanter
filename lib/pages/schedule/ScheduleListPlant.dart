import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nitroplanter/pages/schedule/SchedulePlantComponent.dart';

class ScheduleListPlantComponent extends StatefulWidget {
  final String token;
  final String userId;
  final List idData;
  final List plant;
  final List humidity;
  final List waterAmount;
  final List schedule;
  const ScheduleListPlantComponent({
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
  _ScheduleListPlantComponentState createState() =>
      _ScheduleListPlantComponentState();
}

class _ScheduleListPlantComponentState
    extends State<ScheduleListPlantComponent> {
  // late Future<List> _future;
  // late Future<List> _listPlant;
  // late Future<List> _listSchedule;
  late Future<List> _dataFirebase;
  late Future<List> _plantParameterFirebase;

  late List plant = [];
  late List waterAmount = [];
  late List humidity = [];
  late List schedule = [];
  late List idData = [];
  String urlMaster =
      "https://nitroplanterfirebase-default-rtdb.asia-southeast1.firebasedatabase.app/";

  Future<List> getPlantParameterFirebase() async {
    Uri url = Uri.parse("$urlMaster/plant_parameter.json?auth=" + widget.token);
    var response = await http.get(url);

    var mantap = jsonDecode(response.body);
    return mantap;
    //   // mantap.forEach((id, data) {
    //   //   print(data);
    //   // });
    //   // print(data);
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
  void initState() {
    _plantParameterFirebase = getPlantParameterFirebase();
    _dataFirebase = getDataFirebase();
    // _future = getData();
    // _listPlant = getParameterPlant();
    // _listSchedule = getParameterSchedule();
    super.initState();
    // print(_future);
  }

  // Future<List> getData() async {
  //   final response = await http
  //       .get(Uri.parse("http://192.168.43.7/nitroplanter/get_plant.php"));
  //   if (response.statusCode == 200) {
  //     return json.decode(response.body);
  //   } else {
  //     throw Exception('Failed to load content');
  //   }
  // }

  // Future<List> getParameterPlant() async {
  //   final response = await http.get(
  //       Uri.parse("http://192.168.43.7/nitroplanter/get_plant_parameter.php"));

  //   if (response.statusCode == 200) {
  //     return json.decode(response.body);
  //   } else {
  //     throw Exception('Failed to load content');
  //   }
  // }

  // Future<List> getParameterSchedule() async {
  //   final response = await http.get(Uri.parse(
  //       "http://192.168.43.7/nitroplanter/get_schedule_parameter.php"));
  //   if (response.statusCode == 200) {
  //     return json.decode(response.body);
  //   } else {
  //     throw Exception('Failed to load content');
  //   }
  // }

  // Stream.fromFuture(_future);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List>(
        future: Future.wait([_dataFirebase, _plantParameterFirebase]),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? SchedulePlantComponent(
                  token: widget.token,
                  userId: widget.userId,
                  plant2: plant,
                  waterAmount: waterAmount,
                  schedule2: schedule,
                  humidity: humidity,
                  idData: idData,
                  plantParameterFirebase: snapshot.data![1] ?? [],
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

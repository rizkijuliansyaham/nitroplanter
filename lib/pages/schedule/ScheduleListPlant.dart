import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nitroplanter/pages/schedule/SchedulePlantComponent.dart';

class ScheduleListPlantComponent extends StatefulWidget {
  const ScheduleListPlantComponent({Key? key}) : super(key: key);

  @override
  _ScheduleListPlantComponentState createState() =>
      _ScheduleListPlantComponentState();
}

class _ScheduleListPlantComponentState
    extends State<ScheduleListPlantComponent> {
  late Future<List> _future;
  late Future<List> _listPlant;
  late Future<List> _listSchedule;

  @override
  void initState() {
    _future = getData();
    _listPlant = getParameterPlant();
    _listSchedule = getParameterSchedule();
    super.initState();
    // print(_future);
  }

  Future<List> getData() async {
    final response = await http
        .get(Uri.parse("http://192.168.43.7/nitroplanter/get_plant.php"));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load content');
    }
  }

  Future<List> getParameterPlant() async {
    final response = await http.get(
        Uri.parse("http://192.168.43.7/nitroplanter/get_plant_parameter.php"));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load content');
    }
  }

  Future<List> getParameterSchedule() async {
    final response = await http.get(Uri.parse(
        "http://192.168.43.7/nitroplanter/get_schedule_parameter.php"));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load content');
    }
  }

  // Stream.fromFuture(_future);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List>(
        future: Future.wait([_future, _listPlant, _listSchedule]),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          // if (snapshot.hasData) print(snapshot.hasData);
          // print(snapshot.data![0]);
          return snapshot.hasData
              ? SchedulePlantComponent(
                  list: snapshot.data![0] ?? [],
                  plant: snapshot.data![1] ?? [],
                  schedule: snapshot.data![2] ?? [],
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

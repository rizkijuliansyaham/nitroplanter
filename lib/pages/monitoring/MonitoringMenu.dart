import 'package:flutter/material.dart';
import 'package:nitroplanter/pages/monitoring/MonitoringListComponent.dart';
import 'package:nitroplanter/pages/monitoring/temperature/TemperatureComponent.dart';

class MonitoringMenu extends StatefulWidget {
  final String token;
  final String userId;
  final List idData;
  final List plant;
  final List humidity;
  final List waterAmount;
  final List schedule;
  const MonitoringMenu({
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
  _MonitoringMenuState createState() => _MonitoringMenuState();
}

class _MonitoringMenuState extends State<MonitoringMenu> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
      ),
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                  child: Column(
                    children: [
                      Expanded(
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(Icons.arrow_back)),
                            ],
                          ),
                          flex: 1),
                      Container(
                        width: 200,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              "assets/images/monitoring.png",
                              width: 50,
                              height: 50,
                            ),
                            Text(
                              'Monitoring',
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          child: TemperatureComponent(
                              token: widget.token, userId: widget.userId),
                          flex: 2),
                    ],
                  ),
                  flex: 2),
              Expanded(
                  child: MonitoringListComponent(
                    token: widget.token,
                    userId: widget.userId,
                    plant: widget.plant,
                    waterAmount: widget.waterAmount,
                    schedule: widget.schedule,
                    humidity: widget.humidity,
                    idData: widget.idData,
                  ),
                  flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nitroplanter/pages/schedule/ScheduleListPlant.dart';

class ScheduleMenu extends StatefulWidget {
  final String token;
  final String userId;
  final List idData;
  final List plant;
  final List humidity;
  final List waterAmount;
  final List schedule;
  const ScheduleMenu({
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
  _ScheduleMenuState createState() => _ScheduleMenuState();
}

class _ScheduleMenuState extends State<ScheduleMenu> {
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
                    flex: 2,
                  ),
                  Expanded(
                    child: Container(
                      width: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            "assets/images/schedule.png",
                            width: 50,
                            height: 50,
                          ),
                          Text(
                            'Schedule',
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    flex: 2,
                  ),
                ],
              ),
              flex: 1,
            ),
            Expanded(
              // child: PlantComponent(),
              child: ScheduleListPlantComponent(
                token: widget.token,
                userId: widget.userId,
                plant: widget.plant,
                waterAmount: widget.waterAmount,
                schedule: widget.schedule,
                humidity: widget.humidity,
                idData: widget.idData,
              ),
              flex: 4,
            ),
            //expanded 2
          ],
        )),
      ),
    );
  }
}

// class Person {
//   String name;
//   Person(this.name);
// }

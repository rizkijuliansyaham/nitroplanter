import 'package:flutter/material.dart';
import 'package:nitroplanter/pages/schedule/ScheduleListPlant.dart';
import 'package:nitroplanter/pages/home.dart';

class ScheduleMenu extends StatefulWidget {
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
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (contex) => MainMenu()));
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
              child: ScheduleListPlantComponent(),
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

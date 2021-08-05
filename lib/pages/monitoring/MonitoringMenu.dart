import 'package:flutter/material.dart';
import 'package:nitroplanter/pages/monitoring/MonitoringListComponent.dart';
import 'package:nitroplanter/pages/monitoring/temperature/TemperatureComponent.dart';
import 'package:nitroplanter/pages/home.dart';

class MonitoringMenu extends StatefulWidget {
  const MonitoringMenu({Key? key}) : super(key: key);

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
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (contex) => MainMenu()));
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
                      Expanded(child: TemperatureComponent(), flex: 2),
                    ],
                  ),
                  flex: 2),
              Expanded(child: MonitoringListComponent(), flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}

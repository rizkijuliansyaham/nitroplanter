import 'package:flutter/material.dart';
import 'package:nitroplanter/pages/schedule/ScheduleCard.dart';
import 'package:nitroplanter/pages/monitoring/monitoringCard.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text('Welcome to Flutter'),
        // ),
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
              children: [ScheduleCard(), MonitoringCard()],
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
      ),
    ));
  }
}

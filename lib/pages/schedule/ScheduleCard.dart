import 'package:flutter/material.dart';
import 'package:nitroplanter/pages/schedule/ScheduleMenu.dart';

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 78,
      // color: Colors.amber,
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20),
      child: Card(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          highlightColor: Colors.red.withAlpha(20),
          splashColor: Colors.blue.withAlpha(20),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ScheduleMenu(),
              ),
            );
          },
          child: Row(
            children: [
              Image.asset(
                "assets/images/schedule-box.png",
                width: 89,
                height: 89,
              ),
              SizedBox(width: 35), // give it width
              Text(
                'Schedule',
                style: TextStyle(fontSize: 25),
              )
            ],
          ),
        ),
      ),
    );
  }
}

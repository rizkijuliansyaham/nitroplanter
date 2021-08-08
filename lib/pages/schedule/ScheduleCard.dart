import 'package:flutter/material.dart';
import 'package:nitroplanter/pages/schedule/ScheduleMenu.dart';
import 'package:page_transition/page_transition.dart';

class ScheduleCard extends StatelessWidget {
  final String token;
  final String userId;
  final List idData;
  final List plant;
  final List humidity;
  final List waterAmount;
  final List schedule;
  const ScheduleCard({
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
            // print(idData);
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.fade,
                    child: ScheduleMenu(
                      token: token,
                      userId: userId,
                      plant: plant,
                      waterAmount: waterAmount,
                      schedule: schedule,
                      humidity: humidity,
                      idData: idData,
                    )));
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => ScheduleMenu(),
            //   ),
            // );
          },
          child: Row(
            children: [
              Image.asset(
                "assets/images/schedule-box.png",
                width: 89,
                height: 89,
              ),
              SizedBox(width: 28), // give it width
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

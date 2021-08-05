import 'package:flutter/material.dart';
import 'package:nitroplanter/pages/monitoring/monitoringMenu.dart';

class MonitoringCard extends StatelessWidget {
  const MonitoringCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 78,
      // color: Colors.amber,
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20),
      child: Card(
        // color: Color.fromRGBO(240, 240, 240, 0.8),
        // color: Colors.transparent,
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
                builder: (context) => MonitoringMenu(),
              ),
            );
          },
          child: Row(
            children: [
              Image.asset(
                "assets/images/monitoring-box.png",
                width: 89,
                height: 89,
              ),
              SizedBox(width: 28), // give it width
              Text(
                'Monitoring',
                style: TextStyle(fontSize: 25),
              )
            ],
          ),
        ),
      ),
    );
  }
}

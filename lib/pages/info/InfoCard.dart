import 'package:flutter/material.dart';
import 'package:nitroplanter/pages/info/InfoMenu.dart';
import 'package:page_transition/page_transition.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({Key? key}) : super(key: key);

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
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.fade, child: InfoMenu()));
          },
          child: Row(
            children: [
              Image.asset(
                "assets/images/info-box.png",
                width: 89,
                height: 89,
              ),
              SizedBox(width: 28), // give it width
              Text(
                'Info',
                style: TextStyle(fontSize: 25),
              )
            ],
          ),
        ),
      ),
    );
  }
}

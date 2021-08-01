import 'package:flutter/material.dart';
import 'package:nitroplanter/pages/menu1.dart';

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
            child: Placeholder(),
            flex: 2,
          ),
          Expanded(
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // padding: EdgeInsets.only(left: 0),
                  child: Container(
                    height: 78,
                    // color: Colors.amber,
                    margin: const EdgeInsets.only(
                        left: 20.0, right: 20.0, bottom: 20),
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
                              builder: (context) => FirstMenu(),
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
                  ),
                ),
              ],
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

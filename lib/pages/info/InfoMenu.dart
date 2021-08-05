import 'package:flutter/material.dart';

class InfoMenu extends StatefulWidget {
  const InfoMenu({Key? key}) : super(key: key);

  @override
  _InfoMenuState createState() => _InfoMenuState();
}

class _InfoMenuState extends State<InfoMenu> {
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
                        width: 120,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              "assets/images/info.png",
                              width: 50,
                              height: 50,
                            ),
                            Text(
                              'Info',
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  flex: 2),
              Expanded(child: Placeholder(), flex: 9),
            ],
          ),
        ),
      ),
    );
  }
}

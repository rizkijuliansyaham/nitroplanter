import 'package:flutter/material.dart';
import 'package:nitroplanter/pages/PlantComponent.dart';
// import 'package:nitroplanter/pages/PlantComponent.dart';
import 'package:nitroplanter/pages/album.dart';
import 'package:nitroplanter/pages/home.dart';
import 'package:nitroplanter/pages/menu2.dart';

// void main() => runApp(FirstMenu());

class FirstMenu extends StatefulWidget {
  @override
  _FirstMenuState createState() => _FirstMenuState();
}

class _FirstMenuState extends State<FirstMenu> {
  // Future<List> getData() async {
  //   final response = await http.get("http://192.168.43.7/my_store/getdata.php");
  //   return json.decode(response.body);
  // }

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
                        IconButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (contex) => MyAlbum()));
                            },
                            icon: const Icon(Icons.arrow_back)),
                        IconButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (contex) => Home()));
                            },
                            icon: const Icon(Icons.arrow_back))
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
              child: ListPlantComponent(),
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

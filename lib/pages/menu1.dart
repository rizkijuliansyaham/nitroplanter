import 'package:flutter/material.dart';
import 'package:nitroplanter/pages/home.dart';

// void main() => runApp(FirstMenu());

class FirstMenu extends StatefulWidget {
  @override
  _FirstMenuState createState() => _FirstMenuState();
}

class _FirstMenuState extends State<FirstMenu> {
  // Person selectedPerson = 'tes';
  // List<Person> persons = [Person("Joni"), Person("Jono")];
  // List<DropdownMenuItem> generateItems(List<Person> persons) {
  //   List<DropdownMenuItem> items = [];
  //   for (var item in persons) {
  //     items.add(DropdownMenuItem(
  //       child: Text(item.name),
  //       value: item,
  //     ));
  //   }
  //   return items;
  // }
  var myInitialPlant = 'Anturium';
  List<String> myPlant = [
    'Anturium',
    'item 2',
    'item 3',
    'item 4',
  ];
  var myInitialSchedule = '2 Hari Sekali';
  List<String> mySchedule = [
    '2 Hari Sekali',
    'Selasa',
    'Rabu',
    'Kamis',
    'Jumat',
    'Sabtu',
    'Minggu',
  ];
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
                        Container(
                          margin: EdgeInsets.all(20),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MainMenu(),
                                ),
                              );
                            },
                            child: Text('Go back!'),
                          ),
                        ),
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
              child: ListView(
                children: [
                  Container(
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: 280,
                          margin: EdgeInsets.all(20),
                          padding: EdgeInsets.only(
                              top: 20, bottom: 20, left: 20, right: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17),
                            color: Colors.grey.withAlpha(30),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(width: 20), // give it width

                                  Text(
                                    'Tanaman 1',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w900,
                                      color: Color.fromRGBO(78, 204, 111, 1),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // SizedBox(width: 50), // give it width

                                  Text(
                                    'Pilih Tanaman',
                                    style: TextStyle(
                                      fontSize: 15,
                                      // fontWeight: FontWeight.w800,
                                      // color: Color.fromRGBO(78, 204, 111, 1),
                                    ),
                                  ),
                                  Container(
                                    height: 40,
                                    width: 170,
                                    padding: EdgeInsets.all(7),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(17),
                                      color: Color.fromRGBO(78, 204, 111, 1),
                                    ),
                                    child: DropdownButton<String>(
                                      // iconSize: 0,
                                      icon: Icon(
                                        // Add this
                                        Icons.arrow_drop_down, // Add this
                                        color: Colors.white,
                                      ),
                                      dropdownColor:
                                          Color.fromRGBO(78, 204, 111, 1),
                                      underline: SizedBox(),
                                      isExpanded: true,
                                      onChanged: (value) {
                                        myInitialPlant = value.toString();
                                        print(myInitialPlant);
                                        setState(() {});
                                      },

                                      value: myInitialPlant.toString(),

                                      items: myPlant.map((items) {
                                        if (items.isEmpty == true) {
                                          items = 'tes';
                                        }
                                        return DropdownMenuItem(
                                            value: items,
                                            child: Text(
                                              items,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            ));
                                      }).toList(), // value: selectedPerson,
                                      // items: generateItems(persons),
                                      // onChanged: (item) {
                                      //   setState(() {
                                      //     selectedPerson = item;
                                      //   });
                                      // },
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // SizedBox(width: 50), // give it width

                                  Text(
                                    'Pilih Jadwal',
                                    style: TextStyle(
                                      fontSize: 15,
                                      // fontWeight: FontWeight.w800,
                                      // color: Color.fromRGBO(78, 204, 111, 1),
                                    ),
                                  ),
                                  Container(
                                    height: 40,
                                    width: 170,
                                    padding: EdgeInsets.all(7),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(17),
                                      color: Color.fromRGBO(78, 204, 111, 1),
                                    ),
                                    child: DropdownButton<String>(
                                      // iconSize: 0,
                                      icon: Icon(
                                        // Add this
                                        Icons.arrow_drop_down, // Add this
                                        color: Colors.white,
                                      ),
                                      dropdownColor:
                                          Color.fromRGBO(78, 204, 111, 1),
                                      underline: SizedBox(),
                                      isExpanded: true,
                                      onChanged: (value) {
                                        myInitialSchedule = value.toString();
                                        print(myInitialSchedule);
                                        setState(() {});
                                      },

                                      value: myInitialSchedule.toString(),

                                      items: mySchedule.map((items) {
                                        if (items.isEmpty == true) {
                                          items = 'tes';
                                        }
                                        return DropdownMenuItem(
                                            value: items,
                                            child: Text(
                                              items,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            ));
                                      }).toList(), // value: selectedPerson,
                                      // items: generateItems(persons),
                                      // onChanged: (item) {
                                      //   setState(() {
                                      //     selectedPerson = item;
                                      //   });
                                      // },
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // SizedBox(width: 50), // give it width

                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      'Banyak air',
                                      style: TextStyle(
                                        fontSize: 15,
                                        // fontWeight: FontWeight.w800,
                                        // color: Color.fromRGBO(78, 204, 111, 1),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      flex: 3,
                                      child: LinearProgressIndicator()),
                                  Expanded(
                                    flex: 1,
                                    child: Row(
                                      children: [
                                        SizedBox(width: 5),
                                        Text(
                                          '20mm',
                                          style: TextStyle(fontSize: 10),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 7, left: 28),
                          width: 75,
                          height: 75,
                          // color: Colors.blue,
                          child: Image.asset(
                            "assets/images/plant-box.png",
                            width: 50,
                            height: 50,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              flex: 3,
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

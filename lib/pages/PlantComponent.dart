import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PlantComponent extends StatefulWidget {
  final List list;
  final List plant;
  final List schedule;
  // PlantComponent({required this.list});
  const PlantComponent({
    Key? key,
    required this.list,
    required this.plant,
    required this.schedule,
  }) : super(key: key);

  @override
  _PlantComponentState createState() => _PlantComponentState();
}

class _PlantComponentState extends State<PlantComponent> {
  // late int nilai;
  late List<String> selectedPlant;
  late List<String> selectedSchedule;
  late List<TextEditingController> _controllersPlant;
  late List<TextEditingController> _controllersWater;

  @override
  void initState() {
    super.initState();
    selectedPlant = List<String>.generate(widget.list.length, (counter) => "");
    selectedSchedule =
        List<String>.generate(widget.list.length, (counter) => "");
    _controllersPlant = List.generate(
        widget.list.length,
        (counter) =>
            TextEditingController(text: widget.list[counter]['plant']));
    _controllersWater = List.generate(
        widget.list.length,
        (counter) =>
            TextEditingController(text: widget.list[counter]['water_amount']));
  }

  editDataTrial(id, plant, schedule) {
    print(id + plant + schedule);
  }

  editDataPlant(id, plant) async {
    var url = "http://192.168.43.7/nitroplanter/editdataPlant.php";
    http.post(Uri.parse(url), body: {"id": id, "plant": plant});
  }

  editDataWater(id, waterAmount) async {
    var url = "http://192.168.43.7/nitroplanter/editWaterAmount.php";
    http.post(Uri.parse(url), body: {"id": id, "water_amount": waterAmount});
  }

  editDataSchedule(id, schedule) async {
    var url = "http://192.168.43.7/nitroplanter/editdataSchedule.php";
    http.post(Uri.parse(url), body: {"id": id, "schedule": schedule});
  }

  Offset position = Offset(100, 100);
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
    return ListView.builder(
        // ignore: unnecessary_null_comparison
        itemCount: widget.list == null ? 0 : widget.list.length,
        itemBuilder: (context, i) {
          return Container(
            child: Stack(
              children: <Widget>[
                Container(
                  height: 300,
                  margin: EdgeInsets.all(20),
                  padding:
                      EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 15),
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
                            'Tanaman ',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w900,
                              color: Color.fromRGBO(78, 204, 111, 1),
                            ),
                          ),
                          Text(
                            (i + 1).toString(),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Nama Tanaman',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 150,
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(17),
                              color: Color.fromRGBO(78, 204, 111, 1),
                            ),
                            child: Focus(
                              onFocusChange: (value) {
                                print(_controllersPlant[i].text);
                                print(widget.list[i]['id']);
                                editDataPlant(widget.list[i]['id'],
                                    _controllersPlant[i].text);
                              },
                              child: TextField(
                                  controller: _controllersPlant[i],
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.only(left: 0, top: 10),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ))),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
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
                            width: 150,
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(17),
                              color: Color.fromRGBO(78, 204, 111, 1),
                            ),
                            child: DropdownButton(
                              // iconSize: 0,
                              icon: Icon(
                                // Add this
                                Icons.arrow_drop_down, // Add this
                                color: Colors.white,
                              ),
                              underline: SizedBox(),
                              isExpanded: true,
                              dropdownColor: Color.fromRGBO(78, 204, 111, 1),
                              value: selectedSchedule[i].isEmpty
                                  ? widget.list[i]['schedule'].toString()
                                  : selectedSchedule[i].toString(),
                              items: widget.schedule.map((items) {
                                return DropdownMenuItem(
                                    value: items['schedule'].toString(),
                                    child: Text(items['schedule'].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15)));
                              }).toList(), // value: selectedPerson,
                              onChanged: (value) {
                                selectedSchedule[i] = value.toString();
                                setState(() {
                                  editDataSchedule(
                                      widget.list[i]['id'], value.toString());
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Banyak Air',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          Container(
                            width: 150,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('data'),
                                Container(
                                  height: 40,
                                  width: 80,
                                  padding: EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(17),
                                    color: Color.fromRGBO(78, 204, 111, 1),
                                  ),
                                  child: Focus(
                                    onFocusChange: (value) {
                                      print(_controllersWater[i].text);
                                      print(widget.list[i]['id']);
                                      editDataWater(widget.list[i]['id'],
                                          _controllersWater[i].text);
                                    },
                                    child: TextField(
                                        keyboardType: TextInputType.name,
                                        controller: _controllersWater[i],
                                        style: TextStyle(color: Colors.white),
                                        textAlign: TextAlign.center,
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                                left: 0, top: 10),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                            ))),
                                  ),
                                ),
                                Text('data'),
                              ],
                            ),
                          ),
                        ],
                      )
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
          );
        });
  }
}

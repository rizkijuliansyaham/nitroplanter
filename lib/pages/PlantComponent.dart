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

  @override
  void initState() {
    super.initState();
    selectedPlant = List<String>.generate(widget.list.length, (counter) => "");
    selectedSchedule =
        List<String>.generate(widget.list.length, (counter) => "");
  }

  editDataTrial(id, plant, schedule) {
    print(id + plant + schedule);
  }

  editDataPlant(id, plant) async {
    var url = "http://192.168.43.7/nitroplanter/editdataPlant.php";
    http.post(Uri.parse(url), body: {"id": id, "plant": plant});
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
                  height: 280,
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
                            'Pilih Tanaman',
                            style: TextStyle(
                              fontSize: 15,
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
                            child: DropdownButton(
                              icon: Icon(
                                // Add this
                                Icons.arrow_drop_down, // Add this
                                color: Colors.white,
                              ),
                              dropdownColor: Color.fromRGBO(78, 204, 111, 1),
                              underline: SizedBox(),
                              isExpanded: true,
                              // ignore: unnecessary_null_comparison
                              value: selectedPlant[i].isEmpty
                                  ? widget.list[i]['plant'].toString()
                                  : selectedPlant[i].toString(),

                              items: widget.plant.map((items) {
                                return DropdownMenuItem(
                                    value: items['plant'].toString(),
                                    child: Text(items['plant'].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15)));
                              }).toList(),
                              onChanged: (value) {
                                selectedPlant[i] = value.toString();
                                setState(() {
                                  editDataPlant(
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // SizedBox(width: 50), // give it width

                          Expanded(
                            flex: 3,
                            child: Text(
                              'Banyak Air',
                              style: TextStyle(
                                fontSize: 15,
                                // fontWeight: FontWeight.w800,
                                // color: Color.fromRGBO(78, 204, 111, 1),
                              ),
                            ),
                          ),

                          Expanded(
                            flex: 4,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  height: 15,
                                  // width: 100,
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: Container(
                                          width: 100,
                                          height: 5,
                                          color: Colors.grey.withAlpha(100),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          AnimatedContainer(
                                            duration: Duration(seconds: 1),
                                            width: (double.parse(widget.list[i][
                                                                'water_amount']) +
                                                            15)
                                                        .toDouble() <
                                                    100
                                                ? (double.parse(widget.list[i]
                                                        ['water_amount']) +
                                                    5)
                                                : 100,
                                            height: 5,
                                            color: Colors.blue.withAlpha(100),
                                          ),
                                        ],
                                      ),
                                      Positioned(
                                        // left: MediaQuery.of(context)
                                        //     .devicePixelRatio,
                                        // left: _x < 85 ? _x : 85.1,
                                        left: double.parse(widget.list[i]
                                                    ['water_amount']) <
                                                85
                                            ? double.parse(
                                                widget.list[i]['water_amount'])
                                            : 85.1,
                                        child: Draggable(
                                          axis: Axis.horizontal,
                                          onDragEnd: (dragDetails) {
                                            // _x = (dragDetails.offset.dx - 160) >
                                            //         0
                                            //     ? dragDetails.offset.dx - 160
                                            //     : 0;

                                            setState(() {
                                              print(dragDetails.offset.dx);
                                              print(MediaQuery.of(context)
                                                  .devicePixelRatio);
                                            });
                                          },
                                          childWhenDragging: Container(
                                            width: 15,
                                            height: 15,
                                            decoration: BoxDecoration(
                                              color: Colors.blue[600],
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                          child: Container(
                                            width: 15,
                                            height: 15,
                                            decoration: BoxDecoration(
                                              color: Colors.blue[600],
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                          feedback: Container(
                                            width: 15,
                                            height: 15,
                                            decoration: BoxDecoration(
                                              color: Colors.blue[600],
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                        ),
                                      )

                                      //edit progress bar
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Expanded(flex: 1, child: SizedBox()),
                          Expanded(
                            flex: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                SizedBox(width: 5),
                                Text(
                                  // ((_x / 85 * 100) - 1).toDouble() < 100
                                  //     ? ((_x / 85 * 100)).toStringAsFixed(0)
                                  //     : 100.toString(),
                                  (double.parse(
                                              widget.list[i]['water_amount']) +
                                          5)
                                      .toStringAsFixed(0),
                                  style: TextStyle(fontSize: 10),
                                ),
                                Text(
                                  'mm',
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
          );
        });
  }
}

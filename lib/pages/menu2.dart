import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
import 'package:nitroplanter/pages/home.dart';
import './Detail.dart';
import './adddata.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List> _future;

  // late Timer timer;
  // int count = 0;

  @override
  void initState() {
    super.initState();
    _future = getData();
  }

  // Stream<int> counter() async* {
  //   await Future.delayed(Duration(seconds: 1));
  //   yield count++;
  // }

  Future<List> getData() async {
    final response =
        await http.get(Uri.parse("http://192.168.43.7/my_store/getdata.php"));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("MY STORE"),
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: () => Navigator.of(context).push(
          new MaterialPageRoute(
            builder: (BuildContext context) => new AddData(),
          ),
        ),
      ),
      body: FutureBuilder<List>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          // print(snapshot.data);
          return snapshot.hasData
              ? new ItemList(
                  list: snapshot.data ?? [],
                )
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({required this.list});

  hasiL(i) {
    return new Card(
      child: new ListTile(
        title: new Text(list[i]['item_name']),
        leading: new Icon(Icons.widgets),
        subtitle: new Text("Stock : ${list[i]['stock']}"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      // ignore: unnecessary_null_comparison
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new Detail(
                      list: list,
                      index: i,
                    ))),
            child: hasiL(i),
          ),
        );
      },
    );
  }
}

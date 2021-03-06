import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import '../dbhelper.dart';

class ViewAllRentals extends StatefulWidget {
  ViewAllRentals({Key? key}) : super(key: key);

  @override
  _ViewAllRentalsState createState() => _ViewAllRentalsState();
}

class _ViewAllRentalsState extends State<ViewAllRentals> {
  final dbhelper = DatabaseHelper.instance;
  var allrows;
  static int total_remaining_rent = 0;
  static var check;
  List<Map<String, dynamic>> listmap = [];

  //function to return all rows in the form of List of mapof(String,dynamic)
  Future<List<Map<String, dynamic>>?> viewall() async {
    var allrows = await dbhelper.queryall();
    for (var element in allrows!) {
      print(element);
    }
    total_remaining_rent = 0;
    listmap = allrows;
    for (var item in listmap) {
      if (item.values.elementAt(4) == 1) {
        continue;
      } else {
        total_remaining_rent += int.parse(item.values.elementAt(3).toString());
      }
    }
    return allrows;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("See the Rental Status of this month"),
        ),
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    viewall();
                  });
                },
                child: const Text(" View all the data")),
            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: listmap.length,
                itemBuilder: (context, index) {
                  //logic to dynamically generate the status of rent given
                  if (listmap[index].values.elementAt(4) == 1) {
                    check = 'Yes';
                  } else {
                    check = 'No';
                  }

                  return ListTile(
                    leading: const Icon(Icons.person),
                    title: Text(listmap[index].values.elementAt(1).toString()),
                    subtitle: Text(
                        '''Monthly Rent: ${listmap[index].values.elementAt(3).toString()}   Rent Given  :  $check '''),
                  );
                }),
            Expanded(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Total Remaining Rent: $total_remaining_rent INR",
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}

import 'package:database_curd_demo_app/FIrebaseAuth/authentication_service.dart';
import 'package:database_curd_demo_app/pages/customquery.dart';
import 'package:database_curd_demo_app/pages/delete.dart';
import 'package:database_curd_demo_app/pages/insert.dart';
import 'package:database_curd_demo_app/pages/viewall.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../dbhelper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dbhelper = DatabaseHelper.instance;

  //insterting
  void insertdata() async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnName: "Sing",
      DatabaseHelper.columnAge: 45,
      DatabaseHelper.columnMonthlyRent: 4000,
      DatabaseHelper.columnRentGiven: 1000,
    };
    final id = await dbhelper.insert(row);
    print(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cool DATABASE '),
        leading: ElevatedButton(
          onPressed: () {
            context.read<AuthenticationService>().signOut();
          },
          child: const Icon(
            Icons.logout_rounded,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Insertdata()));
              },
              style: ElevatedButton.styleFrom(
                onPrimary: Colors.white,
                primary: Colors.purple,
                onSurface: Colors.grey,
                side: const BorderSide(color: Colors.black, width: 1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 20,
              ),
              child: const Text("Insert Ur renatal data"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ViewAllRentals()));
              },
              style: ElevatedButton.styleFrom(
                onPrimary: Colors.white,
                primary: Colors.purple,
                onSurface: Colors.grey,
                side: const BorderSide(color: Colors.black, width: 1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 20,
              ),
              child: const Text("See all Rental data (Query all)"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CustomQuery()));
              },
              style: ElevatedButton.styleFrom(
                onPrimary: Colors.white,
                primary: Colors.purple,
                onSurface: Colors.grey,
                side: const BorderSide(color: Colors.black, width: 1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 20,
              ),
              child: const Text("Filter data (Query Specific)"),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                onPrimary: Colors.white,
                primary: Colors.purple,
                onSurface: Colors.grey,
                side: const BorderSide(color: Colors.black, width: 1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 20,
              ),
              child: const Text("Update data (to be build)"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DeleteData()));
              },
              style: ElevatedButton.styleFrom(
                onPrimary: Colors.white,
                primary: Colors.purple,
                onSurface: Colors.grey,
                side: const BorderSide(color: Colors.black, width: 1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 20,
              ),
              child: const Text("Delete based on id"),
            ),
          ],
        ),
      ),
    );
  }
}

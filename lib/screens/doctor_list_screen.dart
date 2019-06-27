import 'package:flutter/material.dart';
import 'package:healthy/widgets/doctor-list.dart';
import 'package:healthy/widgets/doctor_list.dart';

class DoctorListScreen extends StatefulWidget {
  @override
  _DoctorListScreenState createState() => _DoctorListScreenState();
}

class _DoctorListScreenState extends State<DoctorListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Doctor List"),
      ),
      body: DoctorListWidget(),
    );
  }
}
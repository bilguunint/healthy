import 'package:flutter/material.dart';
import 'package:healthy/model/doctor.dart';
import 'package:healthy/repositories/database_service.dart';
import 'package:healthy/widgets/doctor_list.dart';
import 'package:provider/provider.dart';

class HeroScreen extends StatelessWidget {
 
  final db = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

          StreamProvider<List<DoctorModel>>.value( // All children will have access to weapons data
            value: db.streamDoctors(),
            child: DoctorListWidget(),
          ),

      ],
    );
  }
}
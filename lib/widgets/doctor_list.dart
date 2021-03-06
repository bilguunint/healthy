import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:healthy/model/doctor.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class DoctorListWidget extends StatefulWidget {
  @override
  _DoctorListWidgetState createState() => _DoctorListWidgetState();
}

class _DoctorListWidgetState extends State<DoctorListWidget> {
  int currentyear;
  @override
  void initState() {
    super.initState();
    var currentdate = new DateTime.now();
    currentyear = currentdate.year.toInt();
  }
  @override
  Widget build(BuildContext context) {
    var doctors = Provider.of<List<DoctorModel>>(context);
    return ListView(
      children: doctors.map<Widget>((DoctorModel doctor) => 
        Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Container(
                padding: EdgeInsets.all(10.0),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Hero(
                          tag: doctor.id,
                          child: Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(doctor.doctorPhoto)),
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              doctor.doctorFirstName +
                                  " " +
                                  doctor.doctorLastName,
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                                  height: 2.0,
                                ),
                            Text(
                                  doctor.doctorHospitalName + " " + "эмнэлэг",
                                  style: TextStyle(fontSize: 14.0),
                                ),
                                SizedBox(
                                  height: 2.0,
                                ),
                            Row(
                              children: <Widget>[
                                Text(
                                  doctor.doctorSpec,
                                  style: TextStyle(
                                      fontSize: 12.0, color: Colors.black26),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Container(
                                  width: 5.0,
                                  height: 5.0,
                                  decoration: new BoxDecoration(
                                    color: Colors.black,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                getExp(doctor.doctorSinceYear) + "жил",
                                style: TextStyle(
                                    fontSize: 12.0,
                                    ),
                              )
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            
                          ],
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(EvaIcons.heartOutline),
                            )
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only( bottom: 5.0),
                      child: new Divider(
                        color: Colors.grey[300],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("12 сэтгэгдэл", style: TextStyle(fontSize: 12.0)),
                        Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "4.5",
                                  style: TextStyle(fontSize: 12.0),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                SmoothStarRating(
                                    allowHalfRating: true,
                                    onRatingChanged: (v) {
                                    
                                    },
                                    starCount: 5,
                                    rating: 4.5,
                                    size: 12.0,
                                    color: Colors.grey,
                                    borderColor: Colors.grey,
                                    spacing: 0.0)
                              ],
                            ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                      child: new Divider(
                        color: Colors.grey[300],
                      ),
                    ),
                      Row(
                        children: <Widget>[
                          
                        ],
                      )
                      
                      
                  ],
                ),
              ),
            )
      )
    );
  }

  getExp(String sinceYear) {
    var since = int.parse(sinceYear);
    var exp = currentyear - since;
    String totalExp = exp.toString();
    return totalExp;
  }
}
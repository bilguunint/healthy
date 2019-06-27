import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthy/model/menu.dart';
import 'package:healthy/screens/doctor_list_screen.dart';
import 'package:healthy/screens/doctor_screen.dart';

class HomeHeader extends StatelessWidget {
  final menuItems = <Menu>[
    Menu(
      title: "Эмч",
      subTitle: "200 гаруй эмч",
      img: 'assets/homeicon/doctor.svg',
      page: HeroScreen()
    ),
    Menu(
      title: "Сувилагч",
      subTitle: "100 дуудлагын сувилагч",
      img: 'assets/homeicon/nurse.svg',
      page: DoctorListScreen()
    ),
    Menu(
      title: "Эмнэлэг",
      subTitle: "80 гаруй эмнэлэг",
      img: 'assets/homeicon/lab.svg',
      page: DoctorListScreen()
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(
        scrollDirection: Axis.horizontal,
        children: menuItems.map<Widget>((Menu menu) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => menu.page,
                  ),
                );
            },
            child:  Padding(
            padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
            child: Container(
              width: 120,
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius:
                          5.0, // has the effect of softening the shadow
                      spreadRadius:
                          1.0, // has the effect of extending the shadow
                      offset: Offset(
                        1.0, // horizontal, move right 10
                        1.0, // vertical, move down 10
                      ),
                    )
                  ],
                  color: Colors.white,
                  border: Border.all(color: Colors.black12, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 40,
                    width: 40,
                    child: SvgPicture.asset(
                      menu.img,
                      colorBlendMode: BlendMode.darken,
                      placeholderBuilder: (BuildContext context) =>
                          new Container(
                              padding: const EdgeInsets.all(30.0),
                              child: const CircularProgressIndicator()),
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    menu.title,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0),
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    menu.subTitle,
                    style: TextStyle(color: Colors.black38, fontSize: 9.0),
                  )
                ],
              ),
            ),
          )
          );
        }).toList());
  }
}

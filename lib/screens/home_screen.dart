import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:healthy/widgets/home_header.dart';

class HomeScreen extends StatefulWidget {
  final FirebaseUser user;
  HomeScreen({Key key, @required this.user}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState(user);
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseUser user;
  _HomeScreenState(this.user);
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: new Drawer(),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            centerTitle: true,
            iconTheme: new IconThemeData(color: Colors.black),
            elevation: 0.0,
            backgroundColor: Colors.white,
            leading: new IconButton(icon: new Icon(EvaIcons.menu2Outline),
            onPressed: () => _scaffoldKey.currentState.openDrawer()),
            title: new Text(
        "Healthy", 
        style: TextStyle(
                  fontSize: Theme.of(context).platform == TargetPlatform.iOS
                      ? 17.0
                      : 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
      ),
            actions: <Widget>[
              IconButton(
                icon: Icon(EvaIcons.pinOutline),
                color: Colors.black,
                iconSize: 20.0,
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  EvaIcons.creditCardOutline,
                ),
                color: Colors.black,
                iconSize: 20.0,
                onPressed: () {},
              ),
            ],
          ),
        ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10.0, top: 20.0, bottom: 15.0),
            child: Text("Та юу хайж байна?", style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold
            ),),
          ),
          
          Container(
            height: 130,
            child: HomeHeader(),
          )
        ],
      ),
    );
  }
}
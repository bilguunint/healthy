import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthy/repositories/user_repository.dart';
import 'package:provider/provider.dart';

class PhoneNumberLogin extends StatefulWidget {
  @override
  _PhoneNumberLoginState createState() => _PhoneNumberLoginState();
}

class _PhoneNumberLoginState extends State<PhoneNumberLogin> {
  TextEditingController _phoneNumController;
  TextEditingController _smsCodeController;
  String verifyId;
  PageController pageController =
      PageController(viewportFraction: 1, keepPage: true);
  @override
  void initState() {
    super.initState();
    _phoneNumController = TextEditingController(text: "");
  }
  
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserRepository>(context);
    return Scaffold(
        body: Container(
          
          child: ListView(
         
            children: <Widget>[

              Padding(
                    padding: EdgeInsets.only(bottom: 20.0, top: 30.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                      "Sondor",
                      style: TextStyle(fontFamily: "Lobster", fontSize: 42.0, color: Color(0xFF504C6B)),
                    ),
                    )
                  ),
                  
              Container(
                height: 300,
                child: PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: pageController,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                     Padding(
                padding: EdgeInsets.all(15.0),
                child: Container(
                  padding: EdgeInsets.only(top: 10.0, bottom: 20.0, right: 15.0, left: 15.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5.0)
                    )
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                    padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                    child: Text("Та өөрийн утасны дугаарыг ашиглан нэвтэрнэ үү. Энэхүү дугаар нь цаашид таны ID болон явах болно",
                    style: TextStyle(color: Color(0xFF504C6B), fontWeight: FontWeight.w500,  fontSize: 12.0, height: 1.5),
                    
                    ),
                  ),
                      Container(
                        padding: EdgeInsets.only(left: 10.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300], width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(5.0))
                        ),
                        child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _phoneNumController,
                    decoration: InputDecoration(
                      icon: SizedBox(
                      height: 30,
                      width: 30,
                      child: SvgPicture.asset(
                      'assets/icons/mongolia.svg',
                    ),
                    ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide:
                              BorderSide(color: Colors.white, width: 2.0)),
                      contentPadding: EdgeInsets.only(
                          left: 0.0, top: 20.0, right: 16.0, bottom: 5.0),
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(15.0)),
                      enabledBorder: const OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderSide: const BorderSide(
                            color: Colors.white, width: 1.0),
                      ),
                      hintText: "Утасны дугаар",
                      hintStyle:
                          TextStyle(fontSize: 12.0, color: Color(0xFF504C6B), fontWeight: FontWeight.bold),
                      labelStyle: TextStyle(
                          fontSize: 13.0,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                      ),
                      SizedBox(
                        height: 20.0,
                      ),




                      InkWell(
  onTap: () async {
    pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.decelerate);
    await user.verifyPhoneNumber(verifyId, "+976"+_phoneNumController.text).whenComplete(() {
      return CircularProgressIndicator();
    });
    
    print(_phoneNumController.text);
  },
  child: new Container(
    //width: 100.0,r
    height: 40.0,
    decoration: new BoxDecoration(
      color: Color(0xFF7966FF),
      borderRadius: new BorderRadius.circular(15.0),
    ),
    child: new Center(child: new Text('Үргэлжүүлэх', style: new TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold, color: Colors.white),),),
  ),
),

                       
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Container(
                  padding: EdgeInsets.only(top: 0.0, bottom: 10.0, right: 20.0, left: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5.0)
                    )
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(user.message,
                    style: TextStyle(color: Color(0xFF504C6B), fontWeight: FontWeight.w500,  fontSize: 12.0, height: 1.5),
                    
                    ),
                  ),
                      Container(
                        padding: EdgeInsets.only(left: 10.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300], width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(5.0))
                        ),
                        child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _smsCodeController,
                    decoration: InputDecoration(
                      
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide:
                              BorderSide(color: Colors.white, width: 2.0)),
                      contentPadding: EdgeInsets.only(
                          left: 0.0, top: 20.0, right: 16.0, bottom: 5.0),
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(15.0)),
                      enabledBorder: const OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderSide: const BorderSide(
                            color: Colors.white, width: 1.0),
                      ),
                      hintText: "6 оронтой нууц үг",
                      hintStyle:
                          TextStyle(fontSize: 12.0, color: Color(0xFF504C6B), fontWeight: FontWeight.bold),
                      labelStyle: TextStyle(
                          fontSize: 13.0,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                    
                    
                  )
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      InkWell(
  onTap: () {
    
  },
  child: new Container(
    //width: 100.0,r
    height: 40.0,
    decoration: new BoxDecoration(
      color: Color(0xFF7966FF),
      borderRadius: new BorderRadius.circular(15.0),
    ),
    child: new Center(child: new Text('Нэвтрэх', style: new TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold, color: Colors.white),),),
  ),
),
SizedBox(height: 20.0,),
InkWell(
  onTap: () {
    pageController.previousPage(duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  },
  child: new Container(
    //width: 100.0,r
    height: 40.0,
    decoration: new BoxDecoration(
      color: Colors.greenAccent[200],
      borderRadius: new BorderRadius.circular(15.0),
    ),
    child: new Center(child: new Text('Буцах', style: new TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold, color: Colors.white),),),
  ),
),

                       
                    ],
                  ),
                ),
              )
                  ],
                ),
              )
             
             
            ],
          ),
        ));
  }
}

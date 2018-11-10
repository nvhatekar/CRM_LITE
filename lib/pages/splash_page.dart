import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {

  @override
  _SplashPageState createState() => new _SplashPageState();
}

class _SplashPageState extends State<SplashPage>{
  //get login stat
  Future<Null> getSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int _login_flag = prefs.getInt("LOGIN_FLAG");
    print(_login_flag);
    if(_login_flag == 1){
      Navigator.of(context).pushReplacementNamed("/home");
    }else{
      Navigator.of(context).pushReplacementNamed("/login");
    }
  }

  //Timer For Splash Screen
  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, getSharedPrefs);
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: new Center(
          child: new Container(
            width: 200.0,
            height: 200.0,
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.redAccent,
            ),
            child: Center(child: Text("SD",style: TextStyle(fontSize: 80.0,color: Colors.white),),),
          ),
        )
    );
  }
}

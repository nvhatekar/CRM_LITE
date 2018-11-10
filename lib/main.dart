import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_login_mvp/pages/client_detail/client_detail_page.dart';
import 'package:flutter_login_mvp/pages/paren_page.dart';
import 'package:flutter_login_mvp/pages/login/login_page.dart';
import 'package:flutter_login_mvp/pages/splash_page.dart';
import 'package:fullscreen_mode/fullscreen_mode.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

void main() {
  return runApp(new MyApp());
}

int _mLoginFlag = 0;

final routes = {
  '/login': (BuildContext context) => new LoginPage(),
  '/home': (BuildContext context) => new MyHomePage(),
  '/': (BuildContext context) =>  new SplashPage(),
};

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    FullscreenMode.setFullscreen;
    return new MaterialApp(

      debugShowCheckedModeBanner:false,
      title: 'SD APP',
      theme: new ThemeData(primarySwatch: Colors.red,),
      routes: routes,

    );
  }
}
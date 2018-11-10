import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_login_mvp/pages/dashbord/home_page.dart';
import 'package:flutter_login_mvp/pages/register/register_page.dart';
import 'package:flutter_login_mvp/pages/view/view_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Key keyRegisterPage = PageStorageKey('keyRegisterPage');
  final Key keyViewPage = PageStorageKey('keyViewPage');
  final Key keyHomePage = PageStorageKey('keyHomePage');
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  int currentTab = 0;

  RegisterPage mRegisterPage;
  ViewPage mViewPage;
  HomePage mHomePage;

  Widget currentPage;
  List<Widget> pages;

  final PageStorageBucket bucket = PageStorageBucket();

  //Set Logout flag
  Future<Null> setLogoutFlag() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('LOGIN_FLAG', 0);
  }

  @override
  void initState() {
    mRegisterPage =
        RegisterPage(key: keyRegisterPage, scaffoldKey: scaffoldKey);
    mViewPage = ViewPage(
      key: keyViewPage,
    );
    mHomePage = HomePage(
      key: keyHomePage,
    );

    pages = [mHomePage, mRegisterPage, mViewPage];

    currentPage = mHomePage;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(

        actions: <Widget>[
          IconButton(
              onPressed: () {
                setLogoutFlag();
                Navigator.of(context).pushReplacementNamed("/login");
              },
              icon: Icon(Icons.power_settings_new))
        ],
        title: Text("SD APP"),
      ),
      body: PageStorage(
        child: currentPage,
        bucket: bucket,
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
            canvasColor: Colors.red,
            primaryColor: Colors.black,
            textTheme: Theme
                .of(context)
                .textTheme
                .copyWith(caption: new TextStyle(color: Colors.black45)),
        ),
        child: BottomNavigationBar(

          currentIndex: currentTab,
          onTap: (int index) {
            setState(() {
              currentTab = index;
              currentPage = pages[index];
            });
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.playlist_add),
              title: Text('Register'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.view_list),
              title: Text("View"),
            ),
          ],
        ),
      ),
    );
  }
}

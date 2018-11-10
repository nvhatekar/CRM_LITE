import 'package:flutter/material.dart';
import 'package:flutter_login_mvp/data/database_helper.dart';
import 'package:flutter_login_mvp/models/user.dart';
import 'package:flutter_login_mvp/pages/login/login_presenter.dart';
import 'package:fullscreen_mode/fullscreen_mode.dart';
import 'package:fullscreen_mode/fullscreen_mode.dart';
import 'package:progress_hud/progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginPageContract {

  BuildContext _ctx;
  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();


  var progress = new ProgressHUD(
    backgroundColor: Colors.black12,
    color: Colors.white,
    containerColor: Colors.teal,
    borderRadius: 5.0,
    text: 'Loading...',

  );

  String _username, _password;

  LoginPagePresenter _presenter;

  _LoginPageState() {
    _presenter = new LoginPagePresenter(this);
  }

  void _submit() {
    FullscreenMode.setFullscreen;
    final form = formKey.currentState;

    if (form.validate()) {
      setState(() {
        showDialog(context: _ctx,builder:(BuildContext _ctx)=>progress );
        _isLoading = true;
        form.save();
        _presenter.doLogin(_username, _password,_isLoading);
      });
    }
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(text),
    ));
  }

  @override
  Widget build(BuildContext context) {


    _ctx = context;

    var loginBtn = new RaisedButton(
      onPressed: _submit,
      child: new Text("My Login"),
      color: Colors.green,
    );
    var loginForm = new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Text(
          "My Login",
          textScaleFactor: 2.0,
        ),
        new Form(
          key: formKey,
          child: new Column(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new TextFormField(
                  onSaved: (val) => _username = val,
                  decoration: new InputDecoration(labelText: "Username"),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new TextFormField(
                  onSaved: (val) => _password = val,
                  decoration: new InputDecoration(labelText: "Password"),
                ),
              ),

            ],
          ),
        ),
        loginBtn
      ],
    );



    return new Scaffold(
      appBar: new AppBar(
        title: new Text("SD APP"),
      ),
      key: scaffoldKey,
      body: loginForm,
    );
  }

  @override
  void onLoginError(String error) {
    // TODO: implement onLoginError
    _showSnackBar(error);
    setState(() {
      _isLoading = false;
      Navigator.pop(context);
    });
  }

  @override
  void onLoginSuccess(User user) async {
    // TODO: implement onLoginSuccess
    setState(() {
      _isLoading = false;
      Navigator.pop(context);
      _showSnackBar("Username or Password is incorrect");
    });
    if(user != null){
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int login_flag = 1;
      await prefs.setInt('LOGIN_FLAG', login_flag);
      Navigator.of(context).pushReplacementNamed("/home");
    }

  }
}

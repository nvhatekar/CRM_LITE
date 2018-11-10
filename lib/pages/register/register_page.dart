import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_login_mvp/models/client.dart';
import 'package:flutter_login_mvp/pages/register/register_presenter.dart';
import 'package:progress_hud/progress_hud.dart';

GlobalKey<ScaffoldState> scaffoldKey;
class RegisterPage extends StatefulWidget {
  RegisterPage({
    Key key,
    scaffoldKey
  }) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    implements RegisterPageContract {
  BuildContext _ctx;
  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  Client client = new Client(null,null,null,null,null,null,null,null,null,null,null,null);
  DateTime _date = new DateTime.now();
  RegisterPagePresenter _presenter;

  _RegisterPageState() {
    _presenter = new RegisterPagePresenter(this);
  }

  var progress = new ProgressHUD(
    backgroundColor: Colors.black12,
    color: Colors.white,
    containerColor: Colors.teal,
    borderRadius: 5.0,
    text: 'Loading...',
  );

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      setState(() {
        showDialog(context: _ctx,builder:(BuildContext _ctx)=>progress );
        form.save();
        _presenter.doRegister(client);
      });
    }
  }

  void _showSnackBar(String text) {
    Scaffold.of(_ctx).showSnackBar(new SnackBar(
      content: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: new Icon(Icons.assignment_turned_in),
          ),

          new Text(text),
        ],
      ),
      duration: Duration(seconds: 3),
    ));
  }

  //Text Field Style Attributes


  @override
  Widget build(BuildContext context) {

    _ctx = context;
    var loginBtn = new RaisedButton(
      padding: EdgeInsets.all(20.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      onPressed: _submit,
      child: Row(
        
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new Text(
            "Register",
            style: TextStyle(color: Colors.white,fontSize: 20.0),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Icon(Icons.send,color: Colors.white,),
          ),
        ],
      ),
      color: Colors.red,
    );
    var loginForm = SingleChildScrollView(
      padding: EdgeInsets.all(10.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Form(
            key: formKey,
            child: new Column(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: new TextFormField(
                    onSaved: (val) => client.firstName = val,
                    decoration: new InputDecoration(labelText: "first name",border:OutlineInputBorder()),
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: new TextFormField(
                    onSaved: (val) => client.lastName = val,
                    decoration: new InputDecoration(labelText: "last name",border: OutlineInputBorder()),
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: new TextFormField(
                    keyboardType: TextInputType.number,
                    onSaved: (val) => client.mobile = val,
                    decoration: new InputDecoration(labelText: "Mobile",counterText:'10 Digits',border: OutlineInputBorder()),
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: new TextFormField(
                    onSaved: (val) => client.email = val,
                    decoration: new InputDecoration(labelText: "Email",border: OutlineInputBorder()),
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: new TextFormField(
                    maxLines: 3,
                    onSaved: (val) => client.address = val,
                    decoration: new InputDecoration(labelText: "Address",border: OutlineInputBorder()),
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.all(10.0),
                  child: new TextFormField(
                    keyboardType: TextInputType.datetime,
                    onSaved: (val) => client.dob = val,
                    decoration:
                        new InputDecoration(labelText: "Date OF Birth(YYYY/MM/DD)",border: OutlineInputBorder()),
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: new TextFormField(

                    onSaved: (val) => client.pan = val,
                    decoration: new InputDecoration(labelText: "PAN No",border: OutlineInputBorder()),
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: new TextFormField(

                    onSaved: (val) => client.adhar = val,
                    decoration: new InputDecoration(labelText: "Aadhaar No",border: OutlineInputBorder()),
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: new TextFormField(
                    onSaved: (val) => client.sname = val,
                    decoration: new InputDecoration(labelText: "Spouse Name",border: OutlineInputBorder()),
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: new TextFormField(
                    onSaved: (val) => client.sdob = val,
                    decoration: new InputDecoration(labelText: "Spouse DOB (YYYY/MM/DD)",border: OutlineInputBorder()),
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: new TextFormField(
                    onSaved: (val) => client.fatname = val,
                    decoration: new InputDecoration(labelText: "Father Name",border: OutlineInputBorder()),
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: new TextFormField(
                    onSaved: (val) => client.fatdob = val,
                    decoration: new InputDecoration(labelText: "Father DOB (YYYY/MM/DD)",border: OutlineInputBorder()),
                  ),
                ),
              ],
            ),
          ),
          loginBtn
        ],
      ),
    );

    return loginForm;
  }

  @override
  void onRegisterError(String error) {
    // TODO: implement onRegisterError
    Navigator.pop(context);
    _showSnackBar("Client Added Successfully");
  }

  @override
  void onRegisterSuccess(Client client) {
    // TODO: implement onRegisterSuccess
    Navigator.pop(context);
  }
}

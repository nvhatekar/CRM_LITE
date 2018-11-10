import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_login_mvp/models/client.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:flutter_login_mvp/models/user.dart';
import 'package:flutter_login_mvp/utils/network_util.dart';

class RestData {
  NetworkUtil _netUtil = new NetworkUtil();
  static final BASE_URL = "http://www.demo.syscort.com/CAAPP/index.php/Api";
  static final LOGIN_URL = BASE_URL + "/checkUser";
  static final REGISTER_URL = BASE_URL + "/registerClient";
  static final ALL_CLIENTS = BASE_URL + "/getClients";

  Future<User> login(String username, String password) async{
    print('base usrl: '+LOGIN_URL);
    final response = await http.post(LOGIN_URL,body: {'email':username,'password':password});
    Map data = json.decode(response.body);
    if(data['status'] == true){
      List mUsers = data['data'];
      Map userdata = mUsers[0];
      print(userdata['email']);
      return new Future.value(new User(username, password));
    }else{
      print('FALSE');
      return null;
    }
  }

  Future<Client> register(Client client) async{
    print('base usrl: '+REGISTER_URL);
    final response = await http.post(REGISTER_URL,body: {
      'fname':client.firstName,
      'lname':client.lastName,
      'mobile':client.mobile,
      'email':client.email,
      'address':client.address,
      'dob':client.dob,
      'pan':client.pan,
      'adhar':client.adhar,
      'sname':client.sname,
      'sdob':client.sdob,
      'fatname':client.fatname,
      'fatdob':client.fatdob,

    });
    print(response);
    Map data = json.decode(response.body);
    print(data);
    if(data['status'] == true){
      List mClient = data['data'];
      Map clientData = mClient[0];
      print(clientData['email']);
      return new Future.value(new Client(null,null,null,null,null,null,null,null,null,null,null,null));
    }else{
      print('FALSE');
      return null;
    }

  }


  Future<List<Client>> fetchClient() async{
    List<Client> clientList = new List();

    final response = await http.post(ALL_CLIENTS,body: { });
    //print(response);
    List mList = json.decode(response.body);

    for(int i=0;i<mList.length;i++){
      Map mClient = mList[i];
      clientList.add(
          Client(
            mClient['fname'],
            mClient['lname'],
            mClient['mobile'],
            mClient['email'],
            mClient['address'],
            mClient['dob'],
            mClient['pan'],
            mClient['adhar'],
            mClient['sname'],
            mClient['sdob'],
            mClient['fatname'],
            mClient['fatdob']
          )
      );
    }
    return new Future.value(clientList);

  }
}

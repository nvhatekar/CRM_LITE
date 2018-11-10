import 'package:flutter/material.dart';
import 'package:flutter_login_mvp/models/client.dart';



class ClientDetail extends StatefulWidget{

  final Client client;

  ClientDetail({Key key,@required this.client}) : super(key: key);

  @override
  _ClientDetailState createState() => _ClientDetailState(client : this.client);
}

class _ClientDetailState extends State<ClientDetail>{
  Client client;

  _ClientDetailState({@required this.client});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text("${client.firstName}"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('${client.email}'),
      ),
    );

  }

}
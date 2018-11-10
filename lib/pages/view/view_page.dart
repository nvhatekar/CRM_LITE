import 'package:flutter/material.dart';
import 'package:flutter_login_mvp/models/client.dart';
import 'package:flutter_login_mvp/pages/client_detail/client_detail_page.dart';
import 'package:flutter_login_mvp/pages/view/view_presenter.dart';
import 'package:progress_hud/progress_hud.dart';

class ViewPage extends StatefulWidget {
  ViewPage({Key key}) : super(key: key);

  @override
  _ViewPageState createState() => _ViewPageState();
}




class _ViewPageState extends State<ViewPage> implements ViewPageContract {
  List<Client> _clientList = List();
  Icon _favIcon = Icon(Icons.favorite);
  Icon _notfavIcon = Icon(Icons.favorite_border);
  ViewPagePresenter _presenter;
  BuildContext _ctx;

  _ViewPageState() {
    _presenter = new ViewPagePresenter(this);
  }

  var progress = new ProgressHUD(
    backgroundColor: Colors.black12,
    color: Colors.white,
    containerColor: Colors.teal,
    borderRadius: 5.0,
    text: 'Loading...',

  );

  @override
  void initState() {
    _presenter.doFetchClient();


  }

  @override
  Widget build(BuildContext context) {

    _ctx = context;


    return Center(
      child: _clientList.length==0 ?progress:Column(
        children: <Widget>[
          ListView.builder(
              itemCount: _clientList.length>0?_clientList.length:0,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: new ListTile(
                    title: Text(_clientList[index].firstName),
                    leading: CircleAvatar(
                      child: Text(_clientList[index].firstName[0].toUpperCase()),
                    ),
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  ClientDetail(client :_clientList[index]),
                        ),
                      );
                    },
                    trailing: Icon(Icons.add_circle),
                    subtitle: Text(_clientList[index].mobile),
                  ),
                );
              }),
        ],
      ),
    );
  }

  @override
  void onFetchClient(List<Client> clientList) {
    print(clientList);
    //Navigator.pop(context);
    setState(() {
      _clientList = clientList;
    });
  }

  @override
  void onFetchClientError(String error) {
    // TODO: implement onFetchClientError
    //Navigator.pop(context);
    print(error);
  }
}

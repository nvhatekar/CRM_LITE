import 'package:flutter_login_mvp/data/rest_data.dart';
import 'package:flutter_login_mvp/models/client.dart';

abstract class ViewPageContract {
  void onFetchClient(List<Client> clientList);
  void onFetchClientError(String error);
}

class ViewPagePresenter {
  ViewPageContract _view;
  RestData api = new RestData();
  ViewPagePresenter(this._view);

  doFetchClient() {
    print('dofetch call');
    api
        .fetchClient()
        .then((clientList) => _view.onFetchClient(clientList))
        .catchError((onError) => _view.onFetchClientError(onError.toString()));
  }
}

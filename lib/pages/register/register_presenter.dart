import 'package:flutter_login_mvp/data/rest_data.dart';
import 'package:flutter_login_mvp/models/client.dart';

abstract class RegisterPageContract {
  void onRegisterSuccess(Client client);
  void onRegisterError(String error);
}

class RegisterPagePresenter {
  RegisterPageContract _view;
  RestData api = new RestData();
  RegisterPagePresenter(this._view);

  doRegister(Client client) {
    api
        .register(client)
        .then((client) => _view.onRegisterSuccess(client))
        .catchError((onError) => _view.onRegisterError(onError.toString()));
  }
}

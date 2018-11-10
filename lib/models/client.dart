class Client{
  String _firstName;
  String _lastName;
  String _mobile;
  String _email;
  String _address;
  String _dob;
  String _pan;
  String _adhar;
  String _sname;
  String _sdob;
  String _fatname;
  String _fatdob;


  Client(this._firstName, this._lastName, this._mobile, this._email,
      this._address, this._dob, this._pan, this._adhar, this._sname, this._sdob,
      this._fatname, this._fatdob);

  String get dob => _dob;

  set dob(String value) {
    _dob = value;
  }

  /*Client(this._firstName, this._lastName, this._mobile, this._email,
      this._address);*/

  String get address => _address;

  set address(String value) {
    _address = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get mobile => _mobile;

  set mobile(String value) {
    _mobile = value;
  }

  String get lastName => _lastName;

  set lastName(String value) {
    _lastName = value;
  }

  String get firstName => _firstName;

  set firstName(String value) {
    _firstName = value;
  }

  String get fatdob => _fatdob;

  set fatdob(String value) {
    _fatdob = value;
  }

  String get fatname => _fatname;

  set fatname(String value) {
    _fatname = value;
  }

  String get sdob => _sdob;

  set sdob(String value) {
    _sdob = value;
  }

  String get sname => _sname;

  set sname(String value) {
    _sname = value;
  }

  String get adhar => _adhar;

  set adhar(String value) {
    _adhar = value;
  }

  String get pan => _pan;

  set pan(String value) {
    _pan = value;
  }


}
class Notice {
  String _organization;
  String _logo;
  String _title;
  String _message;

  String get organization => _organization;

  set organization(String value) => _organization = value;

  String get logo => _logo;

  set logo(String value) => _logo = value;

  String get title => _title;

  set title(String value) => _title = value;

  String get message => _message;

  set message(String value) => _message = value;

  Notice() {}

  Notice.withData(this._organization, this._logo, this._title, this._message);

  String toString() {
    return "organization : ${this._organization} ,logo : ${this._logo} ,title : ${this._title} ,message : ${this._message}";
  }
}

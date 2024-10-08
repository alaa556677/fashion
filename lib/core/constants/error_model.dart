class Errors {
  String? fieldName;
  String? code;
  String? message;
  dynamic fieldLang;
  int? index;

  Errors({this.fieldName, this.code, this.message, this.fieldLang, this.index});

  Errors.fromJson(Map<String, dynamic> json) {
    fieldName = json['fieldName'];
    code = json['code'];
    message = json['message'];
    fieldLang = json['fieldLang'];
    index = json['index'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fieldName'] = this.fieldName;
    data['code'] = this.code;
    data['message'] = this.message;
    data['fieldLang'] = this.fieldLang;
    data['index'] = this.index;
    return data;
  }
}
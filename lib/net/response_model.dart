/// Response的基础model
class ResponseModel {
  int code;
  String msg;
  bool success;
  dynamic data;

  ResponseModel({this.code, this.msg, this.success, this.data});

  ResponseModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    success = json['success'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    dynamic data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    data['success'] = this.success;
    data['data'] = this.data;
    return data;
  }
}

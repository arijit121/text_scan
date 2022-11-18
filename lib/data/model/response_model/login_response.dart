import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

class LoginResponseModel {
  int? status;
  String? msg;
  Data? data;

  LoginResponseModel({this.status, this.msg, this.data});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? name;
  String? mobileNo;
  String? emailId;
  String? registrationStepCompleted;

  Data(
      {this.id,
      this.name,
      this.mobileNo,
      this.emailId,
      this.registrationStepCompleted});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['Name'];
    mobileNo = json['MobileNo'];
    emailId = json['EmailId'];
    registrationStepCompleted = json['registration_step_completed'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Name'] = this.name;
    data['MobileNo'] = this.mobileNo;
    data['EmailId'] = this.emailId;
    data['registration_step_completed'] = this.registrationStepCompleted;
    return data;
  }
}

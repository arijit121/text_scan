class LoginSendModel {
  String? emailId;
  String? password;
  String? appVersion;
  String? deviceId;
  String? platform;

  LoginSendModel({
    this.emailId,
    this.password,
    this.appVersion,
    this.deviceId,
    this.platform,
  });

  LoginSendModel.fromJson(Map<String, dynamic> json) {
    emailId = json['email_id'];
    password = json['password'];
    appVersion = json['app_version'];
    deviceId = json['device_id'];
    platform = json['platform'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email_id'] = this.emailId;
    data['password'] = this.password;
    data['app_version'] = this.appVersion;
    data['device_id'] = this.deviceId;
    data['platform'] = this.platform;

    return data;
  }
}

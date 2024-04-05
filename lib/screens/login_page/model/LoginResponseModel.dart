class LoginResponse {
  String? status;
  String? msg;
  String? sId;
  String? email;
  String? userToken;

  LoginResponse({this.status, this.msg, this.sId, this.email, this.userToken});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    sId = json['_id'];
    email = json['email'];
    userToken = json['userToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['userToken'] = this.userToken;
    return data;
  }
}

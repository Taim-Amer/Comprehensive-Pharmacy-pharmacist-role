class SignupModel {
  bool? status;
  String? message;
  User? user;

  SignupModel({this.status, this.message, this.user});

  SignupModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? name;
  String? email;
  String? phone;
  String? role;
  double? lat;
  double? lng;
  bool? isVerified;
  String? fcmToken;
  String? updatedAt;
  String? createdAt;
  int? id;

  User(
      {this.name,
        this.email,
        this.phone,
        this.role,
        this.lat,
        this.lng,
        this.isVerified,
        this.fcmToken,
        this.updatedAt,
        this.createdAt,
        this.id});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    role = json['role'];
    lat = json['lat'];
    lng = json['lng'];
    isVerified = json['is_verified'];
    fcmToken = json['fcm_token'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['role'] = role;
    data['lat'] = lat;
    data['lng'] = lng;
    data['is_verified'] = isVerified;
    data['fcm_token'] = fcmToken;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}

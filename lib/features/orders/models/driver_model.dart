class DriverModel {
  bool? status;
  String? message;
  List<Drivers>? drivers;

  DriverModel({this.status, this.message, this.drivers});

  DriverModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['drivers'] != null) {
      drivers = <Drivers>[];
      json['drivers'].forEach((v) {
        drivers!.add(Drivers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (drivers != null) {
      data['drivers'] = drivers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Drivers {
  int? id;
  String? name;
  String? email;
  String? phone;
  int? isVerified;
  String? lat;
  String? lng;
  String? role;
  String? fcmToken;
  String? createdAt;
  String? updatedAt;
  int? distance;
  Driver? driver;

  Drivers(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.isVerified,
        this.lat,
        this.lng,
        this.role,
        this.fcmToken,
        this.createdAt,
        this.updatedAt,
        this.distance,
        this.driver});

  Drivers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    isVerified = json['is_verified'];
    lat = json['lat'];
    lng = json['lng'];
    role = json['role'];
    fcmToken = json['fcm_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    distance = json['distance'];
    driver =
    json['driver'] != null ? Driver.fromJson(json['driver']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['is_verified'] = isVerified;
    data['lat'] = lat;
    data['lng'] = lng;
    data['role'] = role;
    data['fcm_token'] = fcmToken;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['distance'] = distance;
    if (driver != null) {
      data['driver'] = driver!.toJson();
    }
    return data;
  }
}

class Driver {
  int? userId;
  String? image;
  int? status;

  Driver({this.userId, this.image, this.status});

  Driver.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    image = json['image'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['image'] = image;
    data['status'] = status;
    return data;
  }
}

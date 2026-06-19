class UserModel {
  final int? id;
  final String? uuid;
  final String? firstname;
  final String? lastname;
  final String? email;
  final String? phone;
  final String? birthday;
  final String? gender;
  final bool? active;
  final String? img;
  final String? role;
  final dynamic shop;
  final dynamic wallet;
  final List<dynamic>? addresses;
  final List<List<double>>? deliveryZone;

  UserModel({
    this.id,
    this.uuid,
    this.firstname,
    this.lastname,
    this.email,
    this.phone,
    this.birthday,
    this.gender,
    this.active,
    this.img,
    this.role,
    this.shop,
    this.wallet,
    this.addresses,
    this.deliveryZone,
  });

  factory UserModel.fromJson(dynamic json) {
    if (json == null) return UserModel();
    return UserModel(
      id: json['id'] is int ? json['id'] : int.tryParse(json['id']?.toString() ?? ''),
      uuid: json['uuid'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      email: json['email'],
      phone: json['phone'],
      birthday: json['birthday'],
      gender: json['gender'],
      active: json['active'] is bool
          ? json['active']
          : (json['active'] is int ? json['active'] != 0 : null),
      img: json['img'],
      role: json['role'],
      shop: json['shop'],
      wallet: json['wallet'],
      addresses: json['addresses'] is List ? json['addresses'] : null,
      deliveryZone: json['delivery_man_delivery_zone'] == null
          ? null
          : List<List<double>>.from(
              (json['delivery_man_delivery_zone'] as List).map(
                (x) => List<double>.from((x as List).map((x) => x?.toDouble())),
              ),
            ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uuid': uuid,
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'phone': phone,
      'birthday': birthday,
      'gender': gender,
      'active': active,
      'img': img,
      'role': role,
      'shop': shop,
      'wallet': wallet,
      'addresses': addresses,
      'delivery_man_delivery_zone': deliveryZone,
    };
  }

  Map<String, dynamic> toJsonForSignUp({bool typeFirebase = false}) {
    return {
      'email': email,
      'firstname': firstname,
      'lastname': lastname,
      'phone': phone,
      'password': '',
      if (typeFirebase) 'type': 'firebase',
    };
  }
}

class LoginResponse {
  final String? timestamp;
  final bool? status;
  final String? message;
  final LoginData? data;

  LoginResponse({
    this.timestamp,
    this.status,
    this.message,
    this.data,
  });

  factory LoginResponse.fromJson(dynamic json) {
    if (json == null) return LoginResponse();
    return LoginResponse(
      timestamp: json['timestamp'],
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? LoginData.fromJson(json['data']) : null,
    );
  }
}

class LoginData {
  final String? accessToken;
  final String? tokenType;
  final UserModel? user;

  LoginData({
    this.accessToken,
    this.tokenType,
    this.user,
  });

  factory LoginData.fromJson(dynamic json) {
    if (json == null) return LoginData();
    return LoginData(
      accessToken: json['access_token'],
      tokenType: json['token_type'],
      user: json['user'] != null ? UserModel.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'token_type': tokenType,
      'user': user?.toJson(),
    };
  }
}

class RegisterResponse {
  final String? timestamp;
  final bool? status;
  final String? message;
  final dynamic data;

  RegisterResponse({
    this.timestamp,
    this.status,
    this.message,
    this.data,
  });

  factory RegisterResponse.fromJson(dynamic json) {
    if (json == null) return RegisterResponse();
    return RegisterResponse(
      timestamp: json['timestamp'],
      status: json['status'],
      message: json['message'],
      data: json['data'],
    );
  }
}

class VerifyPhoneResponse {
  final String? timestamp;
  final bool? status;
  final String? message;
  final dynamic data;

  VerifyPhoneResponse({
    this.timestamp,
    this.status,
    this.message,
    this.data,
  });

  factory VerifyPhoneResponse.fromJson(dynamic json) {
    if (json == null) return VerifyPhoneResponse();
    return VerifyPhoneResponse(
      timestamp: json['timestamp'],
      status: json['status'],
      message: json['message'],
      data: json['data'],
    );
  }
}

class VerifyData {
  final String? token;
  final UserModel? user;

  VerifyData({
    this.token,
    this.user,
  });

  factory VerifyData.fromJson(dynamic json) {
    if (json == null) return VerifyData();
    return VerifyData(
      token: json['token'],
      user: json['user'] != null ? UserModel.fromJson(json['user']) : null,
    );
  }
}

typedef Dyn = dynamic;
class LoginModel {
  final String? email;
  final String? password;

  LoginModel({required this.email, required this.password});

  Map<String, Dyn> toJson() {
    final map = <String, Dyn>{};
    map['email'] = email;
    map['password'] = password;
    return map;
  }
}

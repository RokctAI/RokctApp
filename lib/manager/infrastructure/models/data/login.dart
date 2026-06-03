typedef Dyn = dynamic;
import 'package:rokctapp/manager/infrastructure/services/services.dart';

class LoginModel {
  final String? email;
  final String? password;

  LoginModel({required this.email, required this.password});

  Map<String, Dyn> toJson() {
    final map = <String, Dyn>{};
    AppValidators.isValidEmail(email ?? "")
        ? (map['email'] = email)
        : (map['phone'] = email);
    map['password'] = password; // environment
    return map;
  }
}

typedef Dyn = dynamic;
class SignUpRequest {
  final String? email;

  SignUpRequest({required this.email});

  Map<String, Dyn> toJson() {
    final map = <String, Dyn>{};
    map["email"] = email;
    return map;
  }
}

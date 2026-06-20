class CoreValidators {
  CoreValidators._();

  static bool isValidEmail(String email) => RegExp(
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$",
  ).hasMatch(email);

  static bool isValidPassword(String password) => password.length > 5;

  static bool isValidConfirmPassword(String password, String confirmPassword) =>
      password == confirmPassword;

  static bool isValidPhone(String input) =>
      RegExp(r"^\+?[0-9]{7,15}$").hasMatch(input);

  static String detectType(String input) {
    if (isValidEmail(input)) {
      return "email";
    }
    if (isValidPhone(input)) {
      return "phone";
    } else {
      return "invalid";
    }
  }
}

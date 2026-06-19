class EditProfile {
  String? firstname;
  String? lastname;
  String? birthday;
  String? gender;
  String? phone;
  String? secondPhone;
  String? images;
  String? email;
  String? password;
  String? confirmPassword;
  String? referral;

  EditProfile({
    this.firstname,
    this.lastname,
    this.birthday,
    this.gender,
    this.phone,
    this.secondPhone,
    this.password,
    this.referral,
    this.email,
    this.confirmPassword,
    this.images,
  });

  EditProfile.fromJson(Map<String, Dyn> json) {
    firstname = json['firstname'];
    lastname = json['lastname'];
    birthday = json['birthday'];
    gender = json['gender'];
    email = json['email'];
    password = json['password']; // environment
    confirmPassword = json['password_confirmation']; // environment
    referral = json['referral'];
  }

  Map<String, Dyn> toJson() {
    final Map<String, Dyn> data = <String, Dyn>{};
    if (firstname != null) data['firstname'] = firstname;
    if (lastname != null) data['lastname'] = lastname;
    if (email != null) data['email'] = email;
    if (password != null) data['password'] = password; // environment
    if (referral != null) data['referral'] = referral;
    if (confirmPassword != null) {
      data['password_confirmation'] = confirmPassword; // environment
    }
    if (birthday != null) {
      data['birthday'] = birthday!.contains(" ")
          ? birthday?.substring(0, birthday?.indexOf(" "))
          : birthday;
    }
    if (gender != null) data['gender'] = gender;
    if (images != null && images!.isNotEmpty) data["images"] = [images];
    data["phone"] = phone;
    return data;
  }
}

typedef Dyn = dynamic;

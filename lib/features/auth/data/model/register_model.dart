class RegisterModel {
  String? phone;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? rePassword;

  RegisterModel(
      {this.phone,
        this.firstName,
        this.lastName,
        this.email,
        this.password,
        this.rePassword});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    password = json['password'];
    rePassword = json['re_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['re_password'] = this.rePassword;
    return data;
  }
}
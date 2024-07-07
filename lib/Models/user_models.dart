class UserModels {
  String userName;
  String userEmail;
  String password;
  String token;
  bool isEmail;

  UserModels(
      {required this.userName,
      required this.userEmail,
      required this.password,
      required this.token,
      required this.isEmail});

  Map<String, dynamic> toMap() {
    return {
      "name": userName,
      "email": userEmail,
      "password": password,
      "isEmail": false,
    };
  }

  factory UserModels.fromJson(Map<String, dynamic> json) {
    return UserModels(
      userEmail: json['email'],
      userName: json['name'],
      token: json['token'] ?? '',
      password: json['password'],
      isEmail: json['isEmail'],
    );
  }
}

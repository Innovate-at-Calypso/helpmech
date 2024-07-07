class MechModels {
  String userName;
  String userEmail;
  String password;
  String token;
  bool isEmail;
  bool isMech;
  bool isShop;

  MechModels({
    required this.userName,
    required this.userEmail,
    required this.password,
    required this.token,
    required this.isEmail,
    required this.isMech,
    required this.isShop,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": userName,
      "email": userEmail,
      "password": password,
      "isEmail": false,
      "isMech": true,
    };
  }

  factory MechModels.fromJson(Map<String, dynamic> json) {
    return MechModels(
      userEmail: json['email'],
      userName: json['name'],
      token: json['token'] ?? '',
      password: json['password'],
      isEmail: json['isEamil'], // make it correct after words
      isMech: json['isMech'],
      isShop: json['isShop'],
    );
  }
}

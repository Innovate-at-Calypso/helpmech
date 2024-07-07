class ShopModel {
  String location;
  String pincode;
  String shopName;
  String ownerName;
  String phoneNumber;
  String token;

  ShopModel({
    required this.location,
    required this.pincode,
    required this.shopName,
    required this.ownerName,
    required this.phoneNumber,
    required this.token,
  });

  // Convert ShopModel instance to JSON format
  Map<String, dynamic> toJson() {
    return {
      'location': location,
      'pincode': pincode,
      'shopName': shopName,
      'ownerName': ownerName,
      'phoneNumber': phoneNumber,
      'token': token,
    };
  }

  // Factory method to create a ShopModel instance from a JSON object
  factory ShopModel.fromJson(Map<String, dynamic> json) {
    return ShopModel(
      location: json['location'],
      pincode: json['pincode'],
      shopName: json['shopName'],
      ownerName: json['ownerName'],
      phoneNumber: json['phoneNumber'],
      token: json['shopToken'],
    );
  }
}

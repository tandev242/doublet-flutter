class Delivery {
  final String name;
  final String phoneNumber;
  final String address;
  final bool isDefault;

  Delivery(
      {required this.name,
      required this.phoneNumber,
      required this.address,
      required this.isDefault});

  factory Delivery.fromJson(Map<String, dynamic> json) {
    return Delivery(
        name: json['name'] as String,
        phoneNumber: json['phoneNumber'] as String,
        address: json['address'] as String,
        isDefault: json['isDefault'] as bool);
  }
}

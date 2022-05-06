class Address {
  final String id;
  final String name;
  final String phoneNumber;
  final String address;
  final bool isDefault;

  Address(
      {required this.id,
      required this.name,
      required this.phoneNumber,
      required this.address,
      required this.isDefault});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
        id: json['_id'] as String,
        name: json['name'] as String,
        phoneNumber: json['phoneNumber'] as String,
        address: json['address'] as String,
        isDefault: json['isDefault'] as bool);
  }
}

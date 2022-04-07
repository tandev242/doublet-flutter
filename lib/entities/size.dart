class Size {
  final String id;
  final String name;
  final String description;

  Size({
    required this.id,
    required this.name,
    required this.description,
  });

  factory Size.fromJson(Map<String, dynamic> json) {
    return Size(
      id: json['_id'] as String,
      name: json['size'] as String,
      description: json['description'] as String,
    );
  }
}

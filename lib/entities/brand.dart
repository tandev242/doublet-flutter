class Brand {
  final String id;
  final String name;
  final String? slug;

  Brand({required this.id, required this.name, this.slug});

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['_id'] as String,
      slug: (json['slug'] ?? '') as String,
      name: json['name'] as String
    );
  }
}

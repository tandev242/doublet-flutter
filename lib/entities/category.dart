class Category {
  final String id;
  final String name;
  final String slug;
  final String img;

  Category(
      {required this.id, required this.name, required this.img,required this.slug});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
        id: json['_id'] as String,
        slug: (json['slug'] ?? '') as String,
        name: json['name'] as String,
        img: json['categoryImage'] as String);
  }
}

class Category {
  final String id;
  final String name;
  final String? slug;
  final List<Category>? children;

  Category({required this.id, required this.name, this.slug, this.children});

  factory Category.fromJson(Map<String, dynamic> json, {id}) {
    return Category(
        id: json['_id'] as String,
        slug: (json['slug'] ?? '') as String,
        name: json['name'] as String,
        children: (json['children'] ?? []) as List<Category>);
  }
}

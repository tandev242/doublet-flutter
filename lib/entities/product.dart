import 'package:sp_shop_app/entities/size.dart';

class Product {
  final String id;
  final String name;
  final String slug;
  final String? description;
  final List productPictures;
  final int price;
  final List sizes;
  Product(
      {required this.id,
      required this.name,
      required this.slug,
      required this.price,
      required this.productPictures,
      required this.description,
      required this.sizes});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'] as String,
      name: json['name'] as String,
      slug: json['slug'] as String,
      price: json['price'] as int,
      description: json['description'] ?? '',
      productPictures: ((json['productPictures'] ?? []) as List).map((i) {
        return i['img'];
      }).toList(),
      sizes: ((json['sizes'] ?? []) as List).map((i) {
        print(i);
        String id = i['_id'];
        String size = i['size']['size'];
        String description = i['size']['description'];
        Size sizeItem = Size(id: id, name: size, description: description);
        return sizeItem;
      }).toList(),
    );
  }
}


// class Product {
//   final String id;
//   final String name;
//   final String slug;
//   final Category category;
//   final Brand brand;
//   final String description;
//   final List productPictures;
//   final int price;
//   final List<Size> sizes;
//   final List<Review> reviews;

//   Product(
//       {required this.id,
//       required this.name,
//       required this.slug,
//       required this.category,
//       required this.brand,
//       required this.price,
//       required this.productPictures,
//       required this.description,
//       required this.sizes,
//       required this.reviews});

//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//         id: json['slug'] as String,
//         name: json['name'] as String,
//         slug: json['slug'] as String,
//         category: Category.fromJson(json['category']),
//         brand: Brand.fromJson(json['brand']),
//         price: json['price'] as int,
//         description: json['description'] as String,
//         sizes: json['sizes'] as List<Size>,
//         productPictures: (json['productPictures'] ?? []) as List<String>,
//         reviews: json['reviews'] as List<Review>);
//   }
// }

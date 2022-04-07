class Review {
  final String id;
  final int rating;
  final String comment;

  Review({required this.id, required this.rating, required this.comment});

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['_id'] as String,
      rating: json['rating'] as int,
      comment: json['comment'] as String,
    );
  }
}

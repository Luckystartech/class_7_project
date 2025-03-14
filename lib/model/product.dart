import 'package:flutter/foundation.dart';

import 'package:class_ecommerce_app/model/review.dart';

class Product {
  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.rating,
    required this.review,
    required this.images,
  });

  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double rating;
  final List<Review> review;
  final List<String> images;

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      category: map['category'],
      price: map['price'],
      rating: map['rating'],
      review:
          (map['reviews'] as List)
              .map((reviewsMap) => Review.fromMap(reviewsMap))
              .toList(),
      images: (map['images'] as List).cast<String>(),
    );
  }

  @override
  String toString() {
    return '''Product(
      id: $id, 
      title: $title, 
      description: $description, 
      category: $category, 
      price: $price, 
      rating: $rating, 
      review: $review, 
      images: $images
    )''';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Product && other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}

import 'package:flutter/material.dart';

class Product {
  final String name;
  final double rating;
  final Color color;
  final double upperPrice;
  final double lowerPrice;

  Product({
    required this.name,
    required this.rating,
    this.color = Colors.white,
    required this.lowerPrice,
    required this.upperPrice,
  });
}

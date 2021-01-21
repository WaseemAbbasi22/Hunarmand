import 'package:flutter/material.dart';

class Workers {
  final String name;
  final String category;
  final double rating;
  final double rate;
  final String imageUrl;
  final Color startColor;
  final Color endColor;

  Workers(
      {this.imageUrl,
      this.name,
      this.startColor,
      this.endColor,
      this.rating,
      this.category,
      this.rate});
}

var workers = [
  Workers(
      imageUrl: 'assets/images/james.jpg',
      name: 'james',
      startColor: Colors.deepOrange,
      endColor: Colors.deepOrange[600],
      rating: 4.4,
      category: 'plumber',
      rate: 2000.0),
  Workers(
      imageUrl: 'assets/images/john.jpg',
      name: 'john',
      startColor: Colors.deepOrange,
      endColor: Colors.deepOrange[600],
      rating: 4.4,
      category: 'electracian',
      rate: 2000.0),
  Workers(
      imageUrl: 'assets/images/olivia.jpg',
      name: 'olivia',
      startColor: Colors.deepOrange,
      endColor: Colors.deepOrange[600],
      rating: 4.4,
      category: 'painter',
      rate: 2000.0),
  Workers(
      imageUrl: 'assets/images/steven.jpg',
      name: 'steven',
      startColor: Colors.deepOrange,
      endColor: Colors.deepOrange[600],
      rating: 4.4,
      category: 'gardner',
      rate: 2000.0),
  Workers(
      imageUrl: 'assets/images/sophia.jpg',
      name: 'sophia',
      startColor: Colors.deepOrange,
      endColor: Colors.deepOrange[600],
      rating: 4.4,
      category: 'carpanter',
      rate: 2000.0),
  Workers(
      imageUrl: 'assets/images/sam.jpg',
      name: 'sam',
      startColor: Colors.deepOrange,
      endColor: Colors.deepOrange[600],
      rating: 4.4,
      category: 'cleaner',
      rate: 2000.0),
];

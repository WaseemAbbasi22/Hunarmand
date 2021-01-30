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
      imageUrl: 'assets/userimages/user1.png',
      name: 'Haroon',
      startColor: Colors.deepOrange,
      endColor: Colors.deepOrange[600],
      rating: 4.4,
      category: 'plumber',
      rate: 2000.0),
  Workers(
      imageUrl: 'assets/userimages/user2.png',
      name: 'Mubeen',
      startColor: Colors.deepOrange,
      endColor: Colors.deepOrange[600],
      rating: 4.4,
      category: 'electrician ',
      rate: 2000.0),
  Workers(
      imageUrl: 'assets/userimages/user3.png',
      name: 'Mubeen',
      startColor: Colors.deepOrange,
      endColor: Colors.deepOrange[600],
      rating: 4.4,
      category: 'painter',
      rate: 2000.0),
  Workers(
      imageUrl: 'assets/userimages/user4.png',
      name: 'Jawad',
      startColor: Colors.deepOrange,
      endColor: Colors.deepOrange[600],
      rating: 4.4,
      category: 'gardner',
      rate: 2000.0),
  Workers(
      imageUrl: 'assets/userimages/user5.png',
      name: 'Adeel',
      startColor: Colors.deepOrange,
      endColor: Colors.deepOrange[600],
      rating: 4.4,
      category: 'carpanter',
      rate: 2000.0),
  Workers(
      imageUrl: 'assets/userimages/user6.png',
      name: 'Ali',
      startColor: Colors.deepOrange,
      endColor: Colors.deepOrange[600],
      rating: 4.4,
      category: 'cleaner',
      rate: 2000.0),
];

import 'package:flutter/material.dart';

class Services {
  final String title;
  final String serviceImage;
  final Color color;
  final bool isTapped;

  const Services({
    @required this.title,
    @required this.serviceImage,
    @required this.color,
    this.isTapped = false,
  });

  Services copy({
    String title,
    String serviceImage,
    Color color,
    bool isTapped,
  }) =>
      Services(
        title: title ?? this.title,
        serviceImage: serviceImage ?? this.serviceImage,
        color: color ?? this.color,
        isTapped: isTapped ?? this.isTapped,
      );
}

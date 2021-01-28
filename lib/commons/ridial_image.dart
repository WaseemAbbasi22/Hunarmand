import 'package:flutter/material.dart';

class RoundedImage extends StatelessWidget {
  final String imagePath;
  final Size size;

  const RoundedImage({
    Key key,
    @required this.imagePath,
    this.size = const Size.fromWidth(120),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(80.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            color: Colors.black.withOpacity(0.8),
            offset: Offset(5.0, 6.0),
          ),
        ],
      ),
      child: ClipOval(
        child: Image.asset(
          imagePath,
          width: size.width,
          height: size.width,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}

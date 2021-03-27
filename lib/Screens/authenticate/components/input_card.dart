import 'package:flutter/material.dart';

class InputCard extends StatelessWidget {
  InputCard(
      {this.hintText, this.icon, this.onChange, this.maxline, this.controller});
  final String hintText;
  final IconData icon;
  final Function onChange;
  final int maxline;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        //margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
        child: TextField(
          onChanged: onChange,
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.all(20),

            prefixIcon: Icon(
              icon,
              color: Colors.deepOrange,
            ),

            //suffixIcon: Icon(Icons.filter_list),
          ),
          maxLines: maxline,
        ),
      ),
    );
  }
}

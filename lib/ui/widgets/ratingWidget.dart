import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  final String rating;
  final double size;
  const RatingWidget({super.key, required this.rating, this.size = 8});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF846046),
        borderRadius: BorderRadius.circular(100),
      ),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: Row(
        spacing: 5,
        children: [
          Icon(Icons.star, color: Colors.white, size: size),
          Text(
            rating,
            style: TextStyle(color: Colors.white, fontSize: size),
          ),
        ],
      ),
    );
  }
}

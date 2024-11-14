import 'package:flutter/material.dart';

class MyButtonSingin extends StatelessWidget {
  final Function()? onTap;
  final String text;
  const MyButtonSingin({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(
          20,
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 25,
        ),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}

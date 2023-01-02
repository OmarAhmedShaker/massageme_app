import 'package:flutter/material.dart';

class MyBotton extends StatelessWidget {
  final Color color;
  final String title;
  final VoidCallback onPressed;

  const MyBotton(
      {Key? key,
      required this.color,
      required this.title,
      required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        //تكوين اي شي
        elevation: 5,
        color: color,
        borderRadius: BorderRadius.circular(10),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200, //
          height: 42, //
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

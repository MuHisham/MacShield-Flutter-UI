import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  const Info({super.key, required this.title, required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00ADB5),
        title: Text(
          title,
          style: TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.white,
              fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(18.0),
        child: Text(
          description,
          style: TextStyle(
              fontFamily: 'Quicksand', fontSize: 20, color: Colors.grey[800]),
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}

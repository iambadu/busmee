import 'package:flutter/material.dart';

class BookResults extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Outbound Trip'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(children: [
          Text('Kwabena First Time', style: TextStyle(color: Colors.red, fontSize: 25.0),)
        ],),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../utils/containerwrap.dart';
import '../utils/searchForm.dart';

class Booking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, left: 8.0, right: 8.0, bottom: 8.0),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Column(
            children: [
              ContainerWrap(
                child: Column(
                  children: [SearchForm()],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

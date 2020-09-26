import 'package:flutter/material.dart';
import './screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your the bus app.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Busmee',
      theme: ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            // selectedItemColor: Colors.grey[500],
            // selectedLabelStyle: TextStyle(color: Colors.grey),
            // unselectedItemColor: Colors.grey[700]
            // selectedIconTheme: IconThemeData(color: Colors.grey[500]),
            ),
        appBarTheme: AppBarTheme(
            brightness: Brightness.light,
            // color: Color(0xFFE5DA17),
            elevation: 0.0),
        primaryColor: Color(0xFFE5DA17),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

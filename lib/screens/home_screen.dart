import 'package:busmee/screens/bus_stops.dart';
import 'package:busmee/screens/support.dart';
import 'package:busmee/screens/tickets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './booking.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Booking(),
    TicketScreen(),
    BusStopScreen(),
    SupportScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                'images/bm-logo.svg',
                height: 30.0,
                fit: BoxFit.cover,
              )
            ],
          ),
        ),
        body: _children.elementAt(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0.0,
          backgroundColor: Colors.grey[50],
          currentIndex: _currentIndex,
          selectedItemColor: Colors.grey[800],
          unselectedItemColor: Colors.grey,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.yellow,
              icon: new Icon(Icons.search),
              title: new Text('Booking'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.loyalty),
              title: new Text('Tickets'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.directions_bus),
              title: Text('Bus Stops'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.live_help),
              title: Text('Support'),
            )
          ],
        ));
  }
}

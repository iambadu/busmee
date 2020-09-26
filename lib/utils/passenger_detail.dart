import 'package:flutter/material.dart';

class PassengerDetail extends StatefulWidget {
  @override
  _PassengerDetailState createState() => _PassengerDetailState();
}

class _PassengerDetailState extends State<PassengerDetail> {
  int noKids;
  int noAdults;

  @override
  void initState() {
    super.initState();
    noAdults = 1;
    noKids = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Select Passengers'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context, [noKids, noAdults]);
              },
              icon: Icon(Icons.check),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Adult',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Row(
                    children: [
                      Container(
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              if (noAdults > 1) {
                                noAdults--;
                              }
                            });
                          },
                          iconSize: 28.0,
                          icon: Icon(Icons.remove_circle_outline),
                        ),
                      ),
                      Text(
                        noAdults.toString(),
                        style: TextStyle(fontSize: 20.0),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            noAdults++;
                          });
                        },
                        iconSize: 30.0,
                        icon: Icon(Icons.add_circle_outline),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Child',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (noKids > 0) {
                              noKids--;
                            }
                          });
                        },
                        iconSize: 28.0,
                        icon: Icon(Icons.remove_circle_outline),
                      ),
                      Text(
                        noKids.toString(),
                        style: TextStyle(fontSize: 20.0),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            noKids++;
                          });
                        },
                        iconSize: 28.0,
                        icon: Icon(Icons.add_circle_outline),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

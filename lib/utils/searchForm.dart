import 'package:busmee/screens/book_results.dart';
import 'package:flutter/material.dart';

import 'datefield.dart';
import 'bus_location.dart';
import 'passenger_detail.dart';

class SearchForm extends StatefulWidget {
  @override
  _SearchFormState createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    BusLocation(
                      destination: 'From',
                    ),
                    BusLocation(
                      destination: 'To',
                    ),
                  ],
                ),
                Positioned(
                  bottom: 48.0,
                  right: 20.0,
                  child: Container(
                    child: IconButton(
                      color: Color(0xFF292929),
                      onPressed: () {},
                      alignment: Alignment.center,
                      iconSize: 30.0,
                      icon: Icon(Icons.cached),
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFEEE311),
                    ),
                    height: 45.0,
                    width: 45.0,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                DateField(
                  rstIcon: null,
                  action: 'Departing',
                  initVal: DateTime.now(),
                ),
                SizedBox(
                  width: 10.0,
                ),
                DateField(
                  rstIcon: Icon(Icons.close),
                  action: 'Return',
                ),
              ],
            ),
            PassngerField(),
            SizedBox(
              height: 13.0,
            ),
            Container(
              width: double.infinity,
              child: RaisedButton(
                color: Color(0xFFE5DA17),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => BookResults()));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    'Search'.toUpperCase(),
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PassngerField extends StatefulWidget {
  @override
  _PassngerFieldState createState() => _PassngerFieldState();
}

class _PassngerFieldState extends State<PassngerField> {
  int noAdults = 1;
  int noKids = 0;

  TextEditingController _passngrController;

  @override
  void initState() {
    super.initState();
    _passngrController = TextEditingController(text: '$noAdults Adult');
  }

  void updatePassenger(List<int> noPassngr) {
    setState(() => _passngrController = TextEditingController(
        text: noAdultsString(noPassngr[noAdults]) +
            ' ' +
            noKidString(noPassngr[noKids])));
  }

  String noKidString(noKids) {
    if (noKids > 1) {
      return '$noKids Children';
    } else if (noKids < 1) {
      return '';
    } else {
      return '$noKids Child';
    }
  }

  String noAdultsString(noAdults) {
    if (noAdults > 1) {
      return '$noAdults Adults';
    } else {
      return '$noAdults Adult';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: InkWell(
        onTap: () async {
          final List<int> noPassngr = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PassengerDetail()),
          );
          if (noPassngr != null) {
            updatePassenger(noPassngr);
          }
        },
        child: AbsorbPointer(
          child: TextFormField(
            controller: _passngrController,
            decoration: InputDecoration(
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelText: 'Passengers',
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.only(left: 15.0),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: Colors.grey[500],
                  width: 1.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

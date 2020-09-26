import 'package:flutter/material.dart';

class BusLocation extends StatefulWidget {
  final String destination;
  BusLocation({this.destination});

  @override
  _BusLocationState createState() => _BusLocationState();
}

class _BusLocationState extends State<BusLocation> {
  String cityName = 'Kumasi';
  TextEditingController _arrivValue;

  @override
  void initState() {
    super.initState();
    _arrivValue = TextEditingController(text: cityName);
  }

  void updateCity(String cityName) {
    setState(() => _arrivValue = TextEditingController(
        text: cityName == null ? cityName = 'Kumasi' : cityName));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final cityName =
            await showSearch(context: context, delegate: LocationSearch());
        updateCity(cityName);
      },
      child: AbsorbPointer(
        child: Padding(
          padding: EdgeInsets.only(bottom: 15.0),
          child: TextFormField(
            controller: _arrivValue,
            decoration: InputDecoration(
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelText: widget.destination,
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

// TODO: Work on the other textfield to implement the flip functionality
List citylist = [
  'Accra',
  'Kumasi',
  'Tamale',
  'Sekondi',
  'Takoradi',
  'Ashaiman',
  'Sunyani',
  'Cape Coast',
  'Obuasi',
  'Teshie',
  'Tema',
  'Madina',
  'Koforidua',
  'Wa',
  'Techiman',
  'Ho',
  'Nungua',
  'Lashibi',
  'Dome',
  'Tema New Town',
  'Gbawe',
  'Oduponkpehe',
  'Ejura',
  'Taifa',
  'Bawku',
  'Aflao',
  'Agona Swedru',
  'Bolgatanga',
  'Tafo',
  'Berekum',
  'Nkawkaw',
  'Akim Oda',
  'Winneba',
  'Hohoe',
  'Yendi',
  'Suhum',
  'Kintampo',
  'Adenta East',
  'Nsawam',
  'Mampong',
  'Konongo',
  'Asamankese',
  'Wenchi',
  'Savelugu',
  'Agogo',
  'Anloga',
  'Prestea',
  'Effiakuma',
  'Tarkwa',
  'Elmina',
  'Dunkwa-on-Offin',
  'Begoro',
  'Kpandu',
  'Navrongo',
  'Axim',
  'Apam',
  'Salaga',
  'Saltpond',
  'Akwatia',
  'Shama',
  'Keta',
  'Nyakrom',
  'Bibiani',
  'Somanya',
  'Foso',
  'Nyankpala',
  'Aburi',
  'Mumford',
  'Bechem',
  'Duayaw Nkwanta',
  'Kade',
  'Anomabu',
  'Akropong',
  'Kete-Krachi',
  'Kibi',
  'Kpandae',
  'Mpraeso',
  'Akim Swedru',
  'Aboso',
  'Bekwai',
  'Drobo',
  'Banda Ahenkro'
];

class LocationSearch extends SearchDelegate {
  @override
  String get searchFieldLabel => 'Departure';
  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  // print(listOfCity.map((el) => (el['name'].toString())));
  @override
  Widget buildSuggestions(BuildContext context) {
    // query = query.toUpperCase();
    // ? query
    // : query.replaceFirst(
    //     new RegExp('^[a-z]'), query.substring(0, 1).toUpperCase());
    var scquery = query.isEmpty ? query
        : query.substring(0, 1).toUpperCase() +
            query.substring(1, query.length);
    final list = query.isEmpty
        ? citylist.sublist(1, 4)
        : citylist.where((i) => i.startsWith(scquery)).toList();
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemCount: list.length,
      itemBuilder: (context, int index) {
        return Container(
          child: InkWell(
            onTap: () {
              Navigator.pop(context, list[index].toString());
            },
            child: ListTile(
                // title: Text(list[index].toString()),
                title: RichText(
              text: TextSpan(
                  text: list[index].substring(0, query.length),
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                        text: list[index].substring(query.length),
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.grey[700]))
                  ]),
            )),
          ),
        );
      },
    );
  }
}

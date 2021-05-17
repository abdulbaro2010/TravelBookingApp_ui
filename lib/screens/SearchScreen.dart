import 'package:flutter/material.dart';
import 'package:travel_ui/models/place_model.dart';
import 'package:travel_ui/screens/PlaceScreen.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  int _searchType = 0;

  Column _buildPopularPlaces(){
    List<Widget> popuplarPlaces=[];
    places.forEach((place) {
    popuplarPlaces.add(Container(height: 80.0, 
    child: Center(
      child: ListTile(
        leading: Hero(
          tag: place.imageUrl,
          child: Image(image: AssetImage(place.imageUrl)),
        ),
        title: Text(
         place.city,
         style: TextStyle(
           fontSize: 18.0,
           fontWeight: FontWeight.bold,
         ),
        ),

        subtitle: Text(
         '${place.properties} properties',
         style: TextStyle(
           fontSize: 16.0,
           fontWeight: FontWeight.bold,
         ),
        ),
        trailing: InkResponse(
          onTap: () {
            Navigator.push(context,
             MaterialPageRoute(builder: (_) => PlaceScreen(place: place),
             ),
             );
          },
          child: Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.pinkAccent,

            ),
            child: Icon(Icons.arrow_forward,
            size: 25.0,
            color: Colors.black,
            ),
        ),
      ),
    ),
    )));
    });
    return Column(children: popuplarPlaces);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 50.0),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () => print('Menu'),
                icon: Icon(
                  Icons.menu,
                ),
                color: Colors.black,
              ),
            ],
          ),

          SizedBox(height: 30.0),
          Text('Book Your Desire \nDestination',
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
          ),

          SizedBox(height: 40.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // ignore: deprecated_member_use
              FlatButton(
                padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: BorderSide(
                    color: _searchType == 0 ? Colors.transparent : Colors.yellowAccent,
                  ),
                ),
                color: _searchType == 0 ? Colors.purpleAccent: null,
                child: Text('Hotels',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                ),
                onPressed: () {
                  setState(() {
                    _searchType = 0;
                  });
                },
              ),

                // ignore: deprecated_member_use
                FlatButton(
                padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: BorderSide(
                    color: _searchType == 1 ? Colors.transparent : Colors.black,
                  ),
                ),
                color: _searchType == 1 ? Colors.purpleAccent: null,
                child: Text('Flights',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                ),
                onPressed: () {
                  setState(() {
                    _searchType = 1;
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 30.0),
          TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Where',
              icon: Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Color(0xFFEEF8FF),

                ),
                child: Icon(Icons.location_on,
                size: 25.0,
                color: Colors.blueAccent,
                ),
              ),
            ),
          ),
          Divider(height: 40.0),

          SizedBox(height: 30.0),
          TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Check-in Check-out',
              icon: Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Color(0xFFEEF8FF),

                ),
                child: Icon(Icons.calendar_today,
                size: 25.0,
                color: Colors.blueAccent,
                ),
              ),
            ),
          ),
          Divider(height: 40.0),

          SizedBox(height: 30.0),
          TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: '1 Adults 0 Children 1 Room',
              icon: Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Color(0xFFEEF8FF),

                ),
                child: Icon(Icons.person,
                size: 25.0,
                color: Colors.blueAccent,
                ),
              ),
            ),
          ),
          Divider(height: 40.0),
          // ignore: deprecated_member_use
          FlatButton(
            padding: EdgeInsets.symmetric(vertical: 25.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            color: Colors.blueAccent,
            child: Text('Search',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            ),
            onPressed: ()=> print('Search'),
          ),
          
          SizedBox(height: 30.0),
          Text('Popular Places',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
          ),
          SizedBox(height: 20.0),
          _buildPopularPlaces(),
        ],
      ),
      
    );
  }
}
import 'package:flutter/material.dart';
import 'package:travel_ui/models/place_model.dart';

class PlaceScreen extends StatefulWidget {
  final Place place;

  const PlaceScreen({Key key, this.place}) : super(key: key);
  
  @override
  _PlaceScreenState createState() => _PlaceScreenState();
}

class _PlaceScreenState extends State<PlaceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Hero(
                  tag: widget.place.imageUrl,
                  child: Container(
                    width: double.infinity,
                    height: 600.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFE5F2FF),
                     image: DecorationImage(
                      image:AssetImage(widget.place.imageUrl),
                     ),
                    ),
                  ),
                ),
                Padding(
                padding: EdgeInsets.symmetric(
                 horizontal: 20.0,
                 vertical: 50.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back_ios),
                      color: Colors.black,
                    ),

                     IconButton(
                      onPressed: () => print('Menu'),
                      icon: Icon(Icons.menu),
                      color: Colors.black,
                    ),
                  ],
                ),
                ),
              ],
            ),
            Container(
              height: 400.0,
              width: double.infinity,
              transform: Matrix4.translationValues(0.0, -40.0, 0.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40.0),
              ),
              child: Padding(padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 30.0),
              child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(
                     '${widget.place.city}, ${widget.place.country}',
                     style: TextStyle(
                       fontSize: 28.0,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                   SizedBox(height: 20.0),
                   Row(
                     children: [
                       Icon(
                           Icons.event_available,
                           size: 60.0,
                           color: Colors.black,
                       ),
                       SizedBox(width: 15.0),
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text('Tour of ${widget.place.city}',
                           style: TextStyle(
                             fontWeight: FontWeight.bold,
                             fontSize: 20.0,
                           ),
                           ),
                           Text('Duration 6 Hours',
                           style: TextStyle(
                            fontSize: 18.0
                           ),
                           ),
                         ],
                       ),
                     ],
                   ),
                 ],
              ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.all(20.0),
        height: 130.0,
        decoration: BoxDecoration(
          color: Colors.purpleAccent,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${widget.place.properties}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
                ),

                Text('Properties Found',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
                )
              ],
            ),
            FlatButton(
              padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Text(
                'See All',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () => print('See All'),
            ),
          ],
        ),
      ),
    );
  }
}
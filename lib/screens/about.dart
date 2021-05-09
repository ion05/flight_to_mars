import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  final aboutMission = '''
    Over the past decades, the efforts by scientists and other personnel at NASA and SpaceX have resulted in the establishment of the first colony on Mars. For the past few years, only scientists and experts have been allowed on this colony. 
  ''';
  final spaceTrip = '''
 However, NASA has now decided to allow selected 50 volunteers to the take the first commericial trip to Mars for tourism. 
    This trip is scheduled to begin in about a year from now after the volunteers undergo rigourous training and tests to determine their physcial and mental fitness for the ride. This trip will cost just 500,000 dollars including all training. Be sure, to check out the requirements to see if you are eligible.  
  ''';

  final requirements = '''
  Apart from general physical and mental fitness, all applicants must meet the following criteria on the day they are submitting their application:
  1) Must be 21 Years of Age
  2) Must be a citizen of a country not sanction by the United States 
  3) Must have valid visa to the U.S. 
  4) Weight must be above 50kg and below 80kg
  5) Must have a height of more than 150 cm but less than 200 cm
  6) Must speak English 
  7) Must be physically fit and of mentally sound mind

  ''';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.deepOrange[400],
            title: Text('About The Mission')),
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.all(10.0),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                aboutMission,
                textAlign: TextAlign.justify,
                style:
                    TextStyle(fontFamily: "Roboto-Condensed", fontSize: 18.0),
              ),
              SizedBox(
                height: 10.0,
              ),
              Image(
                image: AssetImage('assets/images/mars_base.jpg'),
              ),
              SizedBox(height: 10.0),
              Text(
                spaceTrip,
                textAlign: TextAlign.justify,
                style:
                    TextStyle(fontFamily: 'Roboto-Condensed', fontSize: 18.0),
              ),
              SizedBox(
                height: 10.0,
              ),
              Image(
                image: AssetImage('assets/images/space_trip.jpg'),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                requirements,
                style:
                    TextStyle(fontFamily: "Roboto-Condensed", fontSize: 18.0),
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.deepOrange[300]),
                      ),
                      child: Text("Register Now",
                          style: TextStyle(
                              fontFamily: "Oswald",
                              fontSize: 20.0,
                              color: Colors.white))),
                ],
              ),
              SizedBox(
                height: 10.0,
              )
            ],
          )),
        ),
      ),
    );
  }
}

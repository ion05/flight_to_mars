import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
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
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut sed felis tincidunt nisl pharetra fermentum quis sed mauris. Integer dictum risus at risus elementum euismod. Phasellus risus dui, hendrerit nec turpis nec, fermentum aliquam mauris. Donec pellentesque facilisis nunc, at dapibus dui pulvinar et',
                textAlign: TextAlign.justify,
                style:
                    TextStyle(fontFamily: "Roboto-Condensed", fontSize: 18.0),
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
              Image(
                image: AssetImage('assets/images/mars_base.jpg'),
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

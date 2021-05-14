import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[400],
        title: Text("Welcome!"),
      ),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 60.0,
              ),
              Image(
                width: 200.0,
                height: 200.0,
                image: AssetImage('assets/images/logo.jpg'),
              ),
              SizedBox(
                height: 60.0,
              ),
              Text(
                "Be One of the First 50 People to Fly to Mars!",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto-Condensed"),
              ),
              SizedBox(
                height: 50.0,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.deepOrange[300]),
                ),
                child: Text("Register Now",
                    style: TextStyle(
                        fontFamily: "Oswald",
                        fontSize: 20.0,
                        color: Colors.white)),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextButton(
                child: Text("About The Mission",
                    style: TextStyle(
                        fontFamily: "Oswald",
                        fontSize: 20.0,
                        color: Colors.white)),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.deepOrange[300]),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/about');
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              TextButton(
                child: Text(
                  'Admin Panel',
                  style: TextStyle(
                      fontFamily: 'Oswald',
                      fontSize: 20.0,
                      color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.deepOrange[300]),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/otp');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitHourGlass(
              color: Colors.deepOrange[400],
              size: 20.0,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Your Application is being Submitted',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto-Condensed'),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SuccessfullSubmission extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Application Status'),
          centerTitle: true,
          backgroundColor: Colors.deepOrange[400],
        ),
        body: Container(
          width: double.infinity,
          child: Text('Your Application has been submitted successfully'),
        ),
      ),
    );
  }
}

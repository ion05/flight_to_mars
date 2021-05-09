import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flight to Mars'),
        ),
        body: Form(
          key: _key,
          child: TextFormField(
            decoration: InputDecoration(hintText: 'Name'),
          ),
        ),
      ),
    );
  }
}

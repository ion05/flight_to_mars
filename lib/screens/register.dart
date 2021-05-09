import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Welcome!'),
      ),
      body: Form(
          key: _key,
          child: TextFormField(
            decoration: InputDecoration(hintText: 'Name'),
            onChanged: (val) {
              name = val;
            },
          )),
    );
  }
}

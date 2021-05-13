import 'package:flight_to_mars/screens/loading.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

final _database = FirebaseFirestore.instance;

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final users = _database.collection('users');
  String name;
  String email;
  String pass;
  String age;
  String country;
  String passId;
  bool passHidden = true;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading
        ? LoadingPage()
        : Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              title: Text('Personal Details'),
              centerTitle: true,
              backgroundColor: Colors.deepOrange[400],
            ),
            body: Container(
              width: double.infinity,
              padding: EdgeInsets.all(15.0),
              child: Form(
                key: _key,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 15.0,
                      ),
                      Image(
                        image: AssetImage('assets/images/pd.jpg'),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        onSaved: (val) {
                          name = val;
                        },
                        validator: (val) {
                          if (val.isEmpty) {
                            return 'Name cant be blank';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            hintText: "Full Name",
                            hintStyle: TextStyle(fontFamily: "Antonio"),
                            prefixIcon: Icon(Icons.person,
                                color: Colors.deepOrange[400]),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(28.0))),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator: (val) {
                            if (EmailValidator.validate(val)) {
                              return null;
                            } else {
                              return "Please Enter a valid Email Address";
                            }
                          },
                          onSaved: (val) {
                            email = val;
                          },
                          decoration: InputDecoration(
                              hintText: "Email",
                              hintStyle: TextStyle(
                                fontFamily: "Antonio",
                              ),
                              prefixIcon: Icon(Icons.email,
                                  color: Colors.deepOrange[400]),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(28.0)))),
                      SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: passHidden,
                        decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: TextStyle(fontFamily: 'Antonio'),
                            prefixIcon:
                                Icon(Icons.lock, color: Colors.deepOrange[400]),
                            suffixIcon: IconButton(
                              icon: Icon(passHidden
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  passHidden = passHidden ? false : true;
                                });
                              },
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(28.0))),
                        validator: (val) {
                          if (val.isEmpty) {
                            return 'Password cannot be empty';
                          }
                          if (val.length < 6) {
                            return 'Password must be at least 6 characters long';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (val) {
                          pass = val;
                        },
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        validator: (val) {
                          var val2 = int.parse(val);
                          if (val2 < 21) {
                            return "You are not eligible to apply. Applicant must be below 21 years of age";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (val) {
                          age = val;
                        },
                        decoration: InputDecoration(
                            hintText: "Age",
                            hintStyle: TextStyle(
                              fontFamily: "Antonio",
                            ),
                            prefixIcon: Icon(Icons.calendar_today,
                                color: Colors.deepOrange[400]),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(28.0))),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        validator: (val) {
                          var countryList = [
                            'Iran',
                            'Iraq',
                            'Cuba',
                            'North Korea'
                          ];
                          if (val.isEmpty) {
                            return 'Country cannot be empty';
                          }
                          if (countryList.contains(val)) {
                            return 'You cannot apply form this country as it is sanctioned by the United States';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (val) {
                          country = val;
                        },
                        decoration: InputDecoration(
                            hintText: 'Country',
                            hintStyle: TextStyle(
                              fontFamily: "Antonio",
                            ),
                            prefixIcon: Icon(Icons.location_on,
                                color: Colors.deepOrange[400]),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(28.0))),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        onSaved: (val) {
                          passId = val;
                        },
                        validator: (val) {
                          if (val.isEmpty) {
                            return 'You must enter your passport id number';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            hintText: 'Passport ID Number',
                            hintStyle: TextStyle(
                              fontFamily: "Antonio",
                            ),
                            prefixIcon: Icon(Icons.card_membership,
                                color: Colors.deepOrange[400]),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(28.0))),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      TextButton(
                          onPressed: () async {
                            try {
                              _key.currentState.save();
                              if (_key.currentState.validate()) {
                                setState(() {
                                  loading = true;
                                });
                                await _auth.createUserWithEmailAndPassword(
                                    email: email, password: pass);
                                print('Registered Sucessfully');
                                final currentUser = _auth.currentUser;
                                await users.doc(currentUser.uid).set({
                                  'full_name': name,
                                  'email': email,
                                  'age': int.parse(age),
                                  'country': country,
                                  'passId': passId
                                }).then((value) => print('User Added'));
                                setState(() {
                                  loading = false;
                                });
                                Navigator.popAndPushNamed(
                                  context,
                                  '/success',
                                );
                              }
                            } catch (e) {
                              print(e);
                            }
                          },
                          child: Text('Register',
                              style: TextStyle(
                                  fontFamily: "Oswald",
                                  fontSize: 20.0,
                                  color: Colors.white)),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.deepOrange[300]),
                          ))
                    ],
                  ),
                ),
              ),
            ));
  }
}

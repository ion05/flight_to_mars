import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  String name;
  String email;
  String pass;
  String age;
  String country;
  String passId;
  bool passHidden = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    onChanged: (val) {
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
                        prefixIcon:
                            Icon(Icons.person, color: Colors.deepOrange[400]),
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
                      onChanged: (val) {
                        email = val;
                      },
                      decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(
                            fontFamily: "Antonio",
                          ),
                          prefixIcon:
                              Icon(Icons.email, color: Colors.deepOrange[400]),
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
                    onChanged: (val) {
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
                    onChanged: (val) {
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
                      var countryList = ['Iran', 'Iraq', 'Cuba', 'North Korea'];
                      if (val.isEmpty) {
                        return 'Country cannot be empty';
                      }
                      if (countryList.contains(val)) {
                        return 'You cannot apply form this country as it is sanctioned by the United States';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (val) {
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
                    onChanged: (val) {
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
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

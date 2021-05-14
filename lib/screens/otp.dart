import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flight_to_mars/global/adminLoading.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OTPVerification extends StatefulWidget {
  @override
  _OTPVerificationState createState() => _OTPVerificationState();
}

final _data = FirebaseFirestore.instance;

class _OTPVerificationState extends State<OTPVerification> {
  final _auth = FirebaseAuth.instance;
  final _key = GlobalKey<FormState>();
  final _admins = _data.collection('admins');
  String name;
  String phone;
  bool loading = false;
  String otp;
  String countryCode;
  String _verificationId;
  String error = "";
  String message = "";
  final SmsAutoFill _autoFill = SmsAutoFill();
  void verifyPhoneNumber() async {
    PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      await _auth.signInWithCredential(phoneAuthCredential);
      setState(() {
        message = 'User automatically signed in';
      });
    };
    PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {
      setState(() {
        error = authException.toString();
      });
    };
    PhoneCodeSent codeSent =
        (String verificationId, [int forceResendingToken]) async {
      setState(() {
        message = 'Please check your Phone for the verification code';
      });
      _verificationId = verificationId;
    };
    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      // showSnackbar("verification code: " + verificationId);
      // _verificationId = verificationId;
    };
    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: phone,
          timeout: const Duration(seconds: 5),
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
    } catch (e) {
      setState(() {
        error = e.toString();
      });
    }
  }

  Future<void> signInWithPhoneNumber() async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: otp,
      );

      final User user = (await _auth.signInWithCredential(credential)).user;
      Navigator.pushReplacementNamed(context, "/admin");
    } catch (e) {
      setState(() {
        error = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? AdminLoadingPage()
        : Scaffold(
            appBar: AppBar(
              title: Text('Verify You are an Admin'),
              centerTitle: true,
              backgroundColor: Colors.deepOrange[400],
            ),
            body: Container(
                padding: EdgeInsets.all(25.0),
                width: double.infinity,
                child: Form(
                  key: _key,
                  child: Column(
                    children: [
                      TextFormField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              hintText: 'Phone Number',
                              hintStyle: TextStyle(fontFamily: 'Antonio')),
                          onChanged: (val) {
                            phone = val;
                          },
                          validator: (val) {
                            var phoneNumbers = [
                              '+919650573555',
                              '+919320776084'
                            ];
                            var valPhone =
                                val.replaceAll(RegExp(r"\s+\b|\b\s"), "");
                            if (valPhone.isEmpty) {
                              return 'You must enter a valid Phone Number';
                            }
                            // if (phoneNumbers.contains(valPhone) == false) {
                            //   return 'Invalid Admin Phone Number. Enter with country code';
                            // }
                            else {
                              return null;
                            }
                          }),
                      SizedBox(
                        height: 15.0,
                      ),
                      TextButton(
                        child: Text('Send Code',
                            style: TextStyle(color: Colors.white)),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.deepOrange[300]),
                        ),
                        onPressed: () async {
                          _key.currentState.save();
                          if (_key.currentState.validate()) {
                            setState(() {
                              loading = true;
                            });
                            verifyPhoneNumber();
                            setState(() {
                              loading = false;
                            });
                          }
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: 'SMS Code',
                            hintStyle: TextStyle(fontFamily: 'Antonio')),
                        keyboardType: TextInputType.number,
                        onChanged: (val) {
                          otp = val;
                        },
                      ),
                      TextButton(
                        child: Text('Verify Code',
                            style: TextStyle(color: Colors.white)),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.deepOrange[300]),
                        ),
                        onPressed: () async {
                          _key.currentState.save();
                          if (_key.currentState.validate()) {
                            setState(() {
                              loading = true;
                            });
                            await signInWithPhoneNumber();
                            setState(() {
                              loading = false;
                            });
                          }
                        },
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(error,
                          style: TextStyle(
                              fontFamily: 'Roboto-Condensed',
                              color: Colors.red)),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        message,
                        style: TextStyle(
                          fontFamily: 'Roboto-Condensed',
                          color: Colors.blue[300],
                        ),
                      )
                    ],
                  ),
                )),
          );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';

class AdminPanel extends StatefulWidget {
  @override
  _AdminPanelState createState() => _AdminPanelState();
}

void mailTo(String toMail, String name) async {
  final mailToLink = Mailto(
      to: [toMail],
      subject: 'Flight To Mars Application Update',
      body: '''
    Dear $name,
    I am an admin from Flight to Mars at NASA. We have the following update for your application. 
    <Write update here>
    Regards, 
    Flight To Mars
    ''');
  await launch("$mailToLink");
}

class _AdminPanelState extends State<AdminPanel> {
  final _database = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Admin Panel'),
          backgroundColor: Colors.deepOrange[400],
          centerTitle: true,
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: _database.collection('users').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return LinearProgressIndicator();
            }
            return ListView.builder(
              itemCount: snapshot.data.docs.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var temp = snapshot.data.docs[index];
                return Container(
                  padding: EdgeInsets.all(10.0),
                  child: Card(
                      shadowColor: Colors.deepOrange[400],
                      child: Column(
                        children: [
                          ListTile(
                              contentPadding: EdgeInsets.all(20.0),
                              leading: Text((index + 1).toString(),
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Oswald')),
                              title: Text(
                                temp["full_name"],
                                style: TextStyle(
                                    fontFamily: 'Oswald', fontSize: 20.0),
                              ),
                              subtitle: Text(
                                "Age: ${temp['age']}\nGender: ${temp['gender']} \nCountry: ${temp['country']} \nPassport Number: ${temp['passId']} \nHeight: ${temp['height']}\nWeight: ${temp['weight']}\nMedical History: ${temp['disease']}\nReason of Participation: ${temp['reason']}",
                                style: TextStyle(
                                    fontFamily: 'Roboto-Condensed',
                                    fontSize: 15.0),
                                textAlign: TextAlign.start,
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  mailTo(temp['email'], temp["full_name"]);
                                },
                                icon: Icon(Icons.email,
                                    color: Colors.deepOrange[400]),
                              )),
                        ],
                      )),
                );
              },
            );
          },
        ));
  }
}

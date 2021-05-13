import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminPanel extends StatefulWidget {
  @override
  _AdminPanelState createState() => _AdminPanelState();
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
                      child: Column(
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.all(15.0),
                        leading: Text((index + 1).toString(),
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Oswald')),
                        title: Text(
                          temp["full_name"],
                          style:
                              TextStyle(fontFamily: 'Oswald', fontSize: 20.0),
                        ),
                        subtitle: Text(
                          "Age: ${temp['age']} \n Country: ${temp['country']} \n Passport Number: ${temp['passId']}",
                          textAlign: TextAlign.start,
                        ),
                      )
                    ],
                  )),
                );
              },
            );
          },
        ));
  }
}

class AdminPanelData extends StatefulWidget {
  @override
  _AdminPanelDataState createState() => _AdminPanelDataState();
}

class _AdminPanelDataState extends State<AdminPanelData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Text('User Data'),
    );
  }
}

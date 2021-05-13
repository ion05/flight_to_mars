import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

class SuccessfullSubmission extends StatefulWidget {
  @override
  _SuccessfullSubmissionState createState() => _SuccessfullSubmissionState();
}

class _SuccessfullSubmissionState extends State<SuccessfullSubmission> {
  ConfettiController _controllerCenter;

  @override
  void initState() {
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 4));
    _controllerCenter.play();
    super.initState();
  }

  @override
  void dispose() {
    _controllerCenter.dispose();
    super.dispose();
  }

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
          padding: EdgeInsets.all(20.0),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(20.0),
                child: Image(
                  image: AssetImage('assets/images/green-tick.png'),
                  height: 70.0,
                  width: 70.0,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Your Application has been submitted successfully',
                style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto-Condensed"),
              ),
              ConfettiWidget(
                confettiController: _controllerCenter,
                blastDirectionality: BlastDirectionality.explosive,
                particleDrag: 0.05,
                emissionFrequency: 0.05,
                numberOfParticles: 25,
                gravity: 0.05,
                colors: const [
                  Colors.deepOrange,
                  Colors.green,
                  Colors.blue,
                  Colors.pink,
                  Colors.purple
                ], // manually specify the colors to be used
              )
            ],
          ),
        ),
      ),
    );
  }
}

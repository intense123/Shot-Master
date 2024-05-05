import 'package:flutter/material.dart';
import 'package:stancebeam/screens/letsgopage.dart';

class TellAboutScreen extends StatefulWidget {
  const TellAboutScreen({super.key});

  @override
  State<TellAboutScreen> createState() => _TellAboutScreenState();
}

class _TellAboutScreenState extends State<TellAboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffafafa),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 35, horizontal: 20),
          children: [
            Text(
              'Tell us About You!',
              style: TextStyle(fontSize: 32),
            ),
            Text(
              'Please choose an option from below',
              style: TextStyle(color: Colors.grey),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => LetsGoPage()));
              },
              child: Container(
                padding: EdgeInsets.only(top: 15),
                margin: EdgeInsets.only(top: 25),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(25)),
                child: Column(
                  children: [
                    Image.asset('assets/iplay.png'),
                    Text('I\'m a Player'),
                    ClipRRect(
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(25)),
                      child: Row(
                        children: [
                          Spacer(),
                          Container(
                              padding: EdgeInsets.all(7),
                              color: Color(0xffFFF6E9),
                              child: Icon(Icons.arrow_forward)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.only(top: 15),
                margin: EdgeInsets.only(top: 25),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(25)),
                child: Column(
                  children: [
                    Image.asset('assets/icoach.png'),
                    Text('I\'m a Coach'),
                    ClipRRect(
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(25)),
                      child: Row(
                        children: [
                          Spacer(),
                          Container(
                              padding: EdgeInsets.all(7),
                              color: Color(0xffE5F6FE),
                              child: Icon(Icons.arrow_forward)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

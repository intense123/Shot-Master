import 'package:flutter/material.dart';

class LetsGoPage extends StatefulWidget {
  const LetsGoPage({super.key});

  @override
  State<LetsGoPage> createState() => _LetsGoPageState();
}

class _LetsGoPageState extends State<LetsGoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Color(0xfffafafa),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: [
            Text(
              'Let\'s Go!',
              style: TextStyle(fontSize: 32),
            ),
            Text(
              'Please choose an option from below',
              style: TextStyle(color: Colors.grey),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.only(top: 25),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(25)),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.asset('assets/have.png'),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              'I have a StanceBeam',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              'Get to know how to install and use StanceBeam',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          Row(
                            children: [
                              Spacer(),
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(25)),
                                child: Container(
                                    padding: EdgeInsets.all(7),
                                    color: Color(0xffFFF6E9),
                                    child: Icon(Icons.arrow_forward)),
                              ),
                            ],
                          ),
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
                margin: EdgeInsets.only(top: 25),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(25)),
                child: Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.asset('assets/explore.png')),
                    Expanded(
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              'Explore StanceBeam app',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              'You can record, share session videos and drills without',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          Row(
                            children: [
                              Spacer(),
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(25)),
                                child: Container(
                                    padding: EdgeInsets.all(7),
                                    color: Color(0xffE5F6FE),
                                    child: Icon(Icons.arrow_forward)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 35),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                elevation: 0,
                side: BorderSide(color: Colors.black),
                fixedSize: Size.fromHeight(50),
              ),
              onPressed: () {},
              child: Text(
                'I Don\'t Have Striker',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: TextButton(
        onPressed: () {},
        child: Text(
          'Skip for Now',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xffEDC670),
          ),
        ),
      ),
    );
  }
}

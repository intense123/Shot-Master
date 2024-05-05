import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stancebeam/screens/loginscreen.dart';

import 'tellaboutscreen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool agree = false;

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore ref = FirebaseFirestore.instance;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController cpass = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8B92E),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(35)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Register',
                    style: TextStyle(fontSize: 32),
                  ),
                  Text(
                    'Enter the credentials below to create your account',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: name,
                          decoration: InputDecoration(
                            hintText: 'Name',
                            labelText: 'Name',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: email,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            labelText: 'Email',
                          ),
                          validator: (email) {
                            if (email!.contains('@')) return null;
                            return 'Please enter a valid email';
                          },
                        ),
                        TextFormField(
                          controller: pass,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            labelText: 'Password',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (value.length < 8) {
                              return 'Password must contain 8 characters';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: cpass,
                          decoration: InputDecoration(
                            hintText: 'Re-enter Password',
                            labelText: 'Re-enter Password',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (value.length < 8) {
                              return 'Password must contain 8 characters';
                            }
                            return null;
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Row(
                            children: [
                              Checkbox(
                                value: agree,
                                onChanged: (v) {
                                  setState(() {
                                    agree = v!;
                                  });
                                },
                              ),
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 25),
                                    children: <TextSpan>[
                                      TextSpan(text: 'I agree to StanceBeam '),
                                      TextSpan(
                                        text: 'TERMS OF USE ',
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xffF8B92E)),
                                      ),
                                      TextSpan(text: 'and '),
                                      TextSpan(
                                        text: 'PRIVACY POLICY',
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xffF8B92E)),
                                      ),
                                    ],
                                  ),
                                  textScaleFactor: 0.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffF8B92E),
                            fixedSize:
                                Size(MediaQuery.of(context).size.width, 55),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              if (agree == false) {
                                Fluttertoast.showToast(
                                    msg:
                                        'Please agree to StanceBeam TERMS OF USE and PRIVACY POLICY');
                                return;
                              }

                              if (pass.text != cpass.text) {
                                Fluttertoast.showToast(
                                    msg:
                                        'Passwords do not match. Please try again');
                                return;
                              }
                              try {
                                var user =
                                    await auth.createUserWithEmailAndPassword(
                                        email: email.text, password: pass.text);
                                user.user!.updateDisplayName(name.text);
                                await ref
                                    .collection('users')
                                    .doc(user.user!.uid)
                                    .set({
                                  'uid': user.user!.uid,
                                  'name': name.text,
                                  'email': email.text,
                                });
                                await auth.signOut();
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => LoginScreen()),
                                    (route) => false);
                              } catch (e) {
                                Fluttertoast.showToast(msg: e.toString());
                              }
                            }
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Spacer(),
                Text(
                  'Already have an account? ',
                  style: TextStyle(color: Colors.grey),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => LoginScreen()));
                  },
                  child: Text(
                    'Sign In',
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:chat_app/screen/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'registration_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> globalKey = GlobalKey();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    bool inAsyncCall = false;
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: inAsyncCall,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: globalKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 150,
                  ),
                  Image.asset('assets/images/scholar.png'),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Scholar Chat',
                    style: TextStyle(fontSize: 22),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Text(
                        'Log IN',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      email.text = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'The emali in empty';
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'The Emalil',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      password.text = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'The Password in empty';
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'The Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (globalKey.currentState!.validate()) {
                        try {
                          UserCredential user = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: email.text, password: password.text);
                          setState(() {});
                          inAsyncCall = true;
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return ChatScreen();
                            },
                          ));
                        } catch (e) {}
                      }
                      setState(() {
                        inAsyncCall = false;
                      });
                    },
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          "Sign IN",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'If you do not have an account?',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return RegistrationScreen();
                            },
                          ));
                        },
                        child: Text(
                          'Registration',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

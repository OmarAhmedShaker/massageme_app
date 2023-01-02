import 'package:flutter/material.dart';
import 'package:massageme_app/screen/chat_screen.dart';
import 'package:massageme_app/widget/my_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RigestrationScreen extends StatefulWidget {
  static const String screenRoute = 'rigestration_screen';
  const RigestrationScreen({Key? key}) : super(key: key);

  @override
  _RigestrationScreenState createState() => _RigestrationScreenState();
}

class _RigestrationScreenState extends State<RigestrationScreen> {
  final auth = FirebaseAuth.instance;

  late String email, password;

  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 180,
                  child: Image.asset("images/logo.png"),
                ),
                SizedBox(
                  height: 50,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange, width: 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange, width: 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                MyBotton(
                    color: Colors.blue[800]!,
                    title: 'register',
                    onPressed: () async {
                      // print(email);
                      // print(password);
                      setState(() {
                        showSpinner = true;
                      });
                      try {
                        final newUser =
                            await auth.createUserWithEmailAndPassword(
                                email: email, password: password);
                        Navigator.pushNamed(context, ChatScreen.screenRoute);
                        showSpinner = false;
                      } catch (e) {
                        print(e);
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
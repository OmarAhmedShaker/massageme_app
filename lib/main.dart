import 'package:flutter/material.dart';
import 'package:massageme_app/screen/chat_screen.dart';
import 'package:massageme_app/screen/rigestration_screen.dart';
import 'package:massageme_app/screen/signin_screen.dart';
import 'package:massageme_app/screen/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MassageMe app',
      theme: ThemeData(primarySwatch: Colors.blue),
      //home: ChatScreen(),
      initialRoute: _auth.currentUser != null
          ? ChatScreen.screenRoute
          : WelcomeScreen.screenRoute,
      routes: {
        WelcomeScreen.screenRoute: (context) => WelcomeScreen(),
        SinginScreen.screenRoute: (context) => SinginScreen(),
        RigestrationScreen.screenRoute: (context) => RigestrationScreen(),
        ChatScreen.screenRoute: (context) => ChatScreen(),
      },
    );
  }
}

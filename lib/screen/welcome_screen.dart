import 'package:flutter/material.dart';
import 'package:massageme_app/screen/rigestration_screen.dart';
import 'package:massageme_app/screen/signin_screen.dart';
import 'package:massageme_app/widget/my_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static const String screenRoute = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                Container(
                  height: 180,
                  child: Image.asset('images/logo.png'),
                ),
                Text(
                  'MassageMe',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Color(0xff2e386b)),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            MyBotton(
                color: Colors.yellow[900]!,
                title: 'Sign in',
                onPressed: () {
                  Navigator.pushNamed(context, SinginScreen.screenRoute);
                }),
            MyBotton(
                color: Colors.blue[900]!,
                title: 'register',
                onPressed: () {
                  Navigator.pushNamed(context, RigestrationScreen.screenRoute);
                }),
          ],
        ),
      ),
    );
  }
}

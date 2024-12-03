import 'package:flutter/material.dart';
import 'package:my_pocket_wallet/screens/loginscreen.dart';


class Splashscreen extends StatefulWidget {
  Splashscreen({Key? key}) : super(key: key);

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.blue.shade500,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(child: _topImageSection()),
          _middleScreenText(),
          _spashButton(context),
        ],
      ),
    ));
  }
}

Widget _topImageSection() {
  return Container(
    child: Center(child: Image.asset("assets/images/splash.png")),
  );
}

Widget _middleScreenText() {
  return Container(
    child: Column(
      children: [
        Text("User Sunday"),
        SizedBox(
          height: 16,
        ),
        Text("Welcome to blur blur...."),
      ],
    ),
  );
}


Widget _spashButton(context) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
            side: BorderSide(
              width: 2.0,
            ),
          ),
          onPressed: () {
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
          },
          child: Icon(Icons.arrow_forward),
        ),
      ],
    ),
  );
}

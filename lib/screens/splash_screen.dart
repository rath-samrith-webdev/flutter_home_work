import 'package:flutter/material.dart';
import 'package:home_work/screens/main_screen.dart';

class SplashScreen extends StatelessWidget {

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: (){
          final route = MaterialPageRoute(builder: (BuildContext context) => MainScreen());
          Navigator.pushReplacement(context, route);
        }, child: Text("Get Start")),
      ),
    );
  }
}

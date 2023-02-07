import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:project/Pages/side_drawer.dart';
import './studenthome.dart';
import './login.dart';

class Routine extends StatefulWidget {
  const Routine({Key? key}) : super(key: key);

  @override
  State<Routine> createState() => _RoutineState();
}

class _RoutineState extends State<Routine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Routine'),
      ),
      body: SafeArea(
        
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Image.asset(
                "assets/images/routine.jpg",
                height: 480,
                width: double.infinity,
              ),
              decoration: BoxDecoration(
                border: Border.all(width: 4),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

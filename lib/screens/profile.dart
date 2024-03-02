import 'package:bmi_calc/app_constants/constants.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.person,
              size: 300,
              color: Colors.blueGrey,
            ),
            Center(
              child: Text('Name: Username'),
            ),
            Center(
              child: Text('Email: Usermail'),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.blue,
                      value: 0.7,
                      semanticsLabel: 'Target',
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 50,
                    child: Column(
                      children: [Text('Target'), Text('28.9')],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

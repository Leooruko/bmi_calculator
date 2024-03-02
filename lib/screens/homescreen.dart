import 'package:bmi_calc/app_constants/constants.dart';
import 'package:bmi_calc/screens/profile.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // solves the keyboard overflow error
      body: SingleChildScrollView(
        child: Stack(
          fit: StackFit.loose,
          children: [
            SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // App Bar -> tilte/logo profile navigation
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // logo
                      LOGO,
                      // PROFILE IMAGE
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Profile()));
                          },
                          child: PROFILE),
                    ],
                  ),
                  Row(
                    children: [
                      homeWeightImage,
                      Inputs(),
                    ],
                  ),

                  const CalculateButton()
                  // center of page ->person image,input fields
                  // calculate button
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}

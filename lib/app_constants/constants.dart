// Specisfy text styles, button styles,messeage styles,background style

// logo

import 'dart:math';
import 'dart:core';

import 'package:bmi_calc/screens/error_page.dart';
import 'package:bmi_calc/screens/results.dart';
import 'package:flutter/material.dart';

TextStyle logoTextStyle =
    TextStyle(color: Colors.blue, fontSize: 35, fontWeight: FontWeight.w900);
TextStyle title1 =
    TextStyle(color: Colors.blue, fontSize: 15, fontWeight: FontWeight.w700);
TextStyle subtitle1 =
    TextStyle(color: Colors.purple, fontSize: 13, fontWeight: FontWeight.w700);
TextStyle fancy = TextStyle(
    color: const Color.fromARGB(255, 30, 5, 34),
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w600);
TextStyle BMItitle = TextStyle(
    color: Color.fromARGB(255, 112, 59, 16),
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w300,
    fontSize: 40);
TextStyle BMIScore = TextStyle(
    color: Color.fromARGB(255, 112, 59, 16),
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w600,
    fontSize: 50);
TextStyle demographics = TextStyle(
    color: Color.fromARGB(255, 27, 19, 10),
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w600,
    fontSize: 15);
Widget LOGO = Column(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    Text(
      'BMI',
      style: logoTextStyle,
    ),
    Text(
      'CALCULATOR',
      style: title1,
    ),
    Text(
      'StayFit!',
      style: fancy,
    )
  ],
);

// PROFILE
Widget PROFILE = const CircleAvatar(
  radius: 25,
  backgroundColor: Colors.black,
  backgroundImage: AssetImage(
    'assets/images/profile/profile.png',
  ),
);

Widget homeWeightImage = Container(
  height: 500,
  width: 200,
  decoration: BoxDecoration(
      image: DecorationImage(
          fit: BoxFit.contain,
          image:
              AssetImage('${homeScreen[_random.nextInt(homeScreen.length)]}'))),
);
Random _random = Random();

TextEditingController ageController = TextEditingController();
TextEditingController heightController = TextEditingController();
TextEditingController weightController = TextEditingController();

Widget gap = SizedBox(
  height: 10,
);
Widget horzGap = SizedBox(
  width: 30,
);
bool male = true;

class Inputs extends StatefulWidget {
  const Inputs({super.key});

  @override
  State<Inputs> createState() => _InputsState();
}

class _InputsState extends State<Inputs> {
  @override
  Widget build(BuildContext context) {
    // var _neutral=false;
    return Container(
      padding: EdgeInsets.all(10),
      width: 150,
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    male = true;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: male ? Colors.blue : Colors.white,
                  ),
                  child: Icon(Icons.male),
                ),
              ),
              Container(
                child: Icon(Icons.circle_outlined),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    male = false;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: !male ? Colors.blue : Colors.white,
                  ),
                  child: Icon(Icons.female),
                ),
              )
            ],
          ),
          gap,
          Text(
            'Age',
            style: subtitle1,
          ),
          Container(
            width: 100,
            height: 30,
            child: TextField(
              keyboardType: TextInputType.number,
              controller: ageController,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
          ),
          gap,
          Text(
            'Height(M)',
            style: subtitle1,
          ),
          Container(
            width: 100,
            height: 30,
            child: TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
          ),
          gap,
          Text(
            'Weight(kg)',
            style: subtitle1,
          ),
          Container(
            width: 100,
            height: 30,
            child: TextField(
              keyboardType: TextInputType.number,
              controller: weightController,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
          ),
        ],
      ),
    );
  }
}

class CalculateButton extends StatefulWidget {
  const CalculateButton({super.key});

  @override
  State<CalculateButton> createState() => _CalculateButtonState();
}

class _CalculateButtonState extends State<CalculateButton> {
  bool selected = false;
  var buttonColor = MaterialStatePropertyAll(Colors.green);
  var selectedbuttonColor = MaterialStatePropertyAll(Colors.blue);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: selected ? buttonColor : selectedbuttonColor),
        onPressed: () {
          setState(() {
            if ([
              weightController.text,
              heightController.text,
              ageController.text
            ].any((element) => element.isEmpty)) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ErrorPage(
                            error: 'Error: Missing value(s)',
                          )));
            } else {
              selected = !selected;
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResultsPage()));
            }
          });
        },
        child: Text('Calculate'));
  }
}

List homeScreen =
    List.generate(2, (index) => 'assets/images/homescreen/${index}.png');
List underweight =
    List.generate(2, (index) => 'assets/images/underweight/${index}.png');
List overweight =
    List.generate(2, (index) => 'assets/images/overweight/${index}.png');
List obese = List.generate(2, (index) => 'assets/images/obese/${index}.png');

class ResultsContainer extends StatefulWidget {
  const ResultsContainer({super.key});

  @override
  State<ResultsContainer> createState() => _ResultsContainerState();
}

class _ResultsContainerState extends State<ResultsContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(30),
      child: Column(
        children: [
          Text(
            'BMI Score',
            style: BMIScore,
          ),
          // SCORE
          Text(
            '${(calculatBMI(weightController.text, heightController.text).toStringAsFixed(1))}',
            style: BMItitle,
          ),
          calculatBMI(weightController.text, heightController.text) < 20
              ? Text('Underweight')
              : calculatBMI(weightController.text, heightController.text) <
                          20 &&
                      calculatBMI(
                              weightController.text, heightController.text) >
                          20
                  ? Text('Normal')
                  : calculatBMI(weightController.text, heightController.text) <
                          20
                      ? Text('Overweight')
                      :
                      // GENDER
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Gender:',
                              style: demographics,
                            ),
                            Text(
                              male ? 'Male' : 'Female',
                              style: demographics,
                            )
                          ],
                        ),
          Divider(
            indent: 30,
            endIndent: 30,
          ),
          // AGE
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Age:',
                style: demographics,
              ),
              Text(
                '${ageController.text}',
                style: demographics,
              )
            ],
          ),
          Divider(
            indent: 30,
            endIndent: 30,
          ),
          // HEIGHT
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                '   Height:',
                style: demographics,
              ),
              Text(
                '${heightController.text} metres',
                style: demographics,
              )
            ],
          ),

          // WEIGHT
          Divider(
            indent: 30,
            endIndent: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Weight:',
                style: demographics,
              ),
              Text(
                '${weightController.text} kg',
                style: demographics,
              )
            ],
          ),
          SizedBox(
            height: 50,
          ),

          Container(
              width: 300,
              height: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blueGrey),
                  color: Color.fromARGB(255, 252, 224, 161)),
              child: Center(
                  child: calculatBMI(
                              weightController.text, heightController.text) <
                          20
                      ? Text(
                          'Underweight\nCome on you gotta eat and workout more')
                      : calculatBMI(weightController.text,
                                      heightController.text) <
                                  20 &&
                              calculatBMI(int.parse(weightController.text),
                                      int.parse(heightController.text)) <
                                  20
                          ? Text('Normal\nNice Keep it up')
                          : Text('Overweight\n No way!')))
        ],
      ),
    );
  }
}

double calculatBMI(weight, height) {
  var BMI = int.parse(weight) / double.parse(height);
  return BMI;
}

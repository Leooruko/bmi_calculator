import 'package:bmi_calc/app_constants/constants.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatefulWidget {
  const ResultsPage({super.key});

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Navigate back
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.chevron_left,size: 50,),
                ),
                SizedBox(width: 50,),
                Text('Claculation Result',style: title1,textAlign: TextAlign.center,)
              ],
            ),
            // RESULTS

            ResultsContainer()
          ],
        ))
      
    );
  }
}
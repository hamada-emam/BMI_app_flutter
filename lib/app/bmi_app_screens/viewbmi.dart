// ignore_for_file: must_be_immutable

import 'package:bmi/app/styles/style.dart';

import 'package:flutter/material.dart';

class BMIView extends StatefulWidget {
  // const HomeOfBMI({Key? key}) : super(key: key);
  BMIView({Key? key,
    required this.age,
    required this.bmiResult,
    required this.isMale,
    required this.height,
    required this.weight,
  }) : super(key: key);

  final bool isMale;
  final int age;
  final double bmiResult;
  int weight;
  double height;

  @override
  State<BMIView> createState() => _BMIViewState();
}

class _BMIViewState extends State<BMIView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle:true ,
        backgroundColor: Colors.teal,
        title: Text(
          'نتيجه المؤشر',
          style: style,
        ),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.black,
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              cards('الجنس::', ' \n  <<${widget.isMale ? "أنثى": "ذكر"}>>'),
              cards("العمر::", " \n <<${widget.age} >>سنه "),
              cards(" الوزن ::", " \n <<${widget.weight} >>كج"),
              cards(
                  "الطول", " \n <<${widget.height.toStringAsFixed(1)}>>سم"),
              cards("الحاله المثاليه :",
                  " \n  <<${whichTheIdeal((widget.isMale ? "أنثى": "ذكر"), widget.height)} >> كج "),
              cards("قيمه المؤشر :: ",
                  " \n ${widget.bmiResult.toStringAsFixed(1)}"),
              cards("حالتك الان ::",
                  " \n <<${statmentIfofbmi(widget.bmiResult)}>>"),
            ],
          ),
        ),
      ),
    );
  }

  cards(x, y) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.teal,
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              " $x",
              style: style,
              textAlign: TextAlign.center,
            ),
            Text(
              " $y",
              style: style2,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  statmentIfofbmi(v) {
    String bmiResultinText;
    if (v >= 30) {
      bmiResultinText = "سمين جدا";
    } else if (v > 25 && v < 30) {
      bmiResultinText = "وزن زائد";
    } else if (v >= 18.5 && v <= 24.9) {
      bmiResultinText = "طبيعي";
    } else {
      bmiResultinText = "نحيف";
    }
    return bmiResultinText;
  }

  List weightIdeal = [];

  whichTheIdeal(String x, double yheight) {
    if (x == 'Male' && yheight <= 160) {
      weightIdeal = [54, 52, 51, 49];
    } else if (x == 'Female' && yheight <= 160 && yheight > 30) {
      weightIdeal = [58, 56, 54, 52];
    } else if (x == 'Male' && yheight <= 170 && yheight > 160) {
      weightIdeal = [61, 59, 57, 56];
    } else if (x == 'Female' && yheight <= 170 && yheight > 160) {
      weightIdeal = [65, 63, 62, 60];
    } else if (x == 'Male' && yheight <= 180 && yheight > 170) {
      weightIdeal = [68, 66, 63, 62];
    } else if (x == 'Female' && yheight <= 180 && yheight > 170) {
      weightIdeal = [73, 70, 68, 65];
    } else if (x == 'Male' && yheight <= 220 && yheight > 180) {
      weightIdeal = [76, 73, 70, 68];
    } else if (x == 'Female' && yheight <= 220 && yheight > 180) {
      weightIdeal = [82, 80, 79, 75];
    }
    return weightIdeal;
  }
}

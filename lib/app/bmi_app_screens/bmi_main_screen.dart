import 'dart:math';

import 'package:bmi/app/age_calc_app/age_calc_screen.dart';
import 'package:bmi/app/bmi_app_screens/viewbmi.dart';
import 'package:bmi/app/styles/style.dart';
import 'package:flutter/material.dart';

class BMIMain extends StatefulWidget {
  const BMIMain({Key? key}) : super(key: key);

  @override
  State<BMIMain> createState() => _BMIMainState();
}

class _BMIMainState extends State<BMIMain> {
  bool isMale = true;
  double hieght = 30;
  int wieght = 1;
  int age = age_year;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("كتله الجسم",
            style: (TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold))),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text("تحرك",
                style: (TextStyle(color: Colors.black, fontSize: 20))),
          ),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.supervised_user_circle))
        ],
        // to give the app bar a height of the screen
        elevation: 40,
        // to give it a shadow
        shadowColor: Colors.teal,
        //to give the app bar background color
        backgroundColor: Colors.teal,
        // to give all items into app bar the color
        foregroundColor: Colors.black,
        //put the title in the center
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                m1Expanded(context, "أثنى"),
                m1Expanded(context, "ذكر"),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.blueGrey),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    " : الطول",
                    style: style,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'سم',
                        style: hs,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        hieght.toStringAsFixed(1),
                        style: style2,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Slider(
                      min: 30,
                      max: 220,
                      value: hieght,
                      onChanged: (val) {
                        setState(() {
                          hieght = val;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                m3Expanded(context, age),
                m2Expanded(context, wieght),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return BMIView(
                  age: age,
                  bmiResult: (wieght / pow((hieght / 100), 2)),
                  height: hieght,
                  isMale: isMale,
                  weight: wieght,
                );
              }));
            },
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.teal,
                ),
                margin: const EdgeInsets.only(left: 15, right: 15),
                //  margin: const EdgeInsets.all(10),
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 15,
                alignment: Alignment.center,
                child: const Text(
                  " إضغط لحساب العُمر",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )),
          ),
          const SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }

  Expanded m1Expanded(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isMale = (type == "أثنى") ? true : false;
          });
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: (isMale && type == "أثنى") || (!isMale && type == "ذكر")
                ? Colors.teal.withOpacity(.8)
                : Colors.blueGrey,
          ),
          // height: 200,
          // width: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                type == "أثنى" ? Icons.male : Icons.female,
                size: 90,
                color: Colors.white,
              ),
              Text(
                type == "أثنى" ? "أنثى" : "ذكر",
                style: style,
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded m2Expanded(BuildContext context, int num) {
    return Expanded(
        child: Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.blueGrey,
      ),
      // height: 200,
      // width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                " $wieght",
                style: style2,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "الوزن",
                style: style,
              ),


            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                mini: true,
                onPressed: () {
                  setState(() {
                    if (wieght <= 1) {
                      wieght = 1;
                    } else {
                      wieght--;
                    }
                  });
                },
                heroTag: 'weight--',
                child: const Center(child: Icon(Icons.minimize)),
              ),
              FloatingActionButton(
                mini: true,
                onPressed: () {
                  setState(() {
                    wieght++;
                  });
                },
                heroTag: 'weight++',
                child: const Center(
                    child: Icon(
                  Icons.add,
                )),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Slider(
                  min: 1,
                  max: 200,
                  value: wieght.toDouble(),
                  onChanged: (val) {
                    setState(() {
                      wieght = val.toInt();
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }

  Expanded m3Expanded(BuildContext context, int num) {
    return Expanded(
        child: Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.blueGrey,
      ),
      // height: 200,
      // width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.teal,
                ),
                transform: Matrix4.rotationX((age * 2 * pi)),
                child: Text(
                  '$age',
                  style: style2,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "العمر",
                style: style,
              ),


            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                mini: true,
                onPressed: () {
                  setState(() {
                    if (age <= 1) {
                      age = 1;
                    } else {
                      age--;
                    }
                  });
                },
                heroTag: 'age--',
                child: const Center(child: Icon(Icons.minimize)),
              ),
              FloatingActionButton(
                mini: true,
                onPressed: () {
                  setState(() {
                    age++;
                  });
                },
                heroTag: 'age++',
                child: const Center(
                    child: Icon(
                  Icons.add,
                )),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Slider(
                  min: 1,
                  max: 100,
                  divisions: 100,
                  value: age.toDouble(),
                  onChanged: (val) {
                    setState(() {
                      age = val.toInt();
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}

import 'package:flutter/material.dart';

import '../homebage.dart';
import '../styles/style.dart';

class MyAge extends StatefulWidget {
  const MyAge({Key? key}) : super(key: key);

  @override
  State<MyAge> createState() => _MyAgeState();
}

int age_year = 1;

class _MyAgeState extends State<MyAge> {
  int age_month = 0;
  int age_day = 0;
  var selectedyear;
  var selectedmonth;
  var selectedDay;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.teal,
            leading: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => MyApp()));
                },
                child: const Text(
                  "الرجوع",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )),
            centerTitle: true,
            title: Text(
              "حساب العُمر",
              style: style,
            )),
        body: Container(
          alignment: Alignment.center,
          child: ageMethod(),
        ),
      ),
    );
  }

  void _showDatePicker() {
    var dt;
    showDatePicker(
            context: context,
            initialDate: dt ?? DateTime.now(),
            firstDate: DateTime(1000, 1, 1),
            lastDate: DateTime.now())
        .then((dt) {
      setState(() {
        selectedyear = dt?.year;
        selectedmonth = dt?.month;
        selectedDay = dt?.day;
        calcAge();
      });
    });
  }

  void calcAge() {
    var m = DateTime.now().month;
    var d = DateTime.now().day;
    var y = DateTime.now().year;
    List<int> m_31 = [1, 3, 5, 7, 8, 10, 12];
    List<int> m_30 = [4, 6, 9, 11];
    if (d < selectedDay && m == 2) {
      m -= 1;
      d = d + 28;
      age_day = (d - selectedDay).toInt().abs();
    } else if (d < selectedDay && m_30.contains(m)) {
      m -= 1;
      d = d + 30;
      age_day = (d - selectedDay).toInt().abs();
    } else if (d < selectedDay && m_31.contains(m)) {
      m -= 1;
      d = d + 31;
      age_day = (d - selectedDay).toInt().abs();
    } else {
      age_day = (d - selectedDay).toInt().abs();
    }
    if (m < selectedmonth) {
      y -= 1;
      m += 12;
      age_month = (m - selectedmonth).toInt().abs();
    } else {
      age_month = (m - selectedmonth).toInt();
    }

    age_year = (y - selectedyear).toInt();
  }

  Column ageMethod() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          width: 300,
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              selectedyear != null
                  ? const Text(
                      ": عُمرك الان ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    )
                  : Container(),
              const SizedBox(
                height: 20,
              ),
              Text(
                selectedyear != null
                    ? "years: ${age_year.toStringAsFixed(0)}  month: ${age_month.toStringAsFixed(0)} day:  ${age_day.toStringAsFixed(0)} "
                    : ": من فضلك اختار تاريخ ميلادك",
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 200,
          height: 50,
          child: ElevatedButton(
              onPressed: () {
                _showDatePicker();
              },
              child: const Text(
                "!اختيار التاريخ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              )),
        ),
        const SizedBox(
          height: 150,
        ),
      ],
    );
  }
}

import 'package:bmi/app/sign/sign_in.dart';
import 'package:bmi/app/styles/style.dart';
// import 'package:bmi/widget_reuse/toast.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'age_calc_app/age_calc_screen.dart';
import 'bmi_app_screens/bmi_main_screen.dart';

//we create a class with stateful because of its changed status
//stateful means that it's changed status
//we need two class one to create state and other to handle that state
//as here we invoke the function create state to create it then in the next class we handle what we need the state to do
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

// the class to handle the state work as we need
//_ means that class is private
//extends from Widget state its type is MyApp that its type is StatefulWidget then all is widget
class _MyAppState extends State<MyApp> {
  //the abstract method here is the build method that is invoking the context which returned by this class
  //the BuildContext here means that the location at tree of widgets
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 4, 124, 221),
      appBar: AppBar(
        actions: [
          // ignore: prefer_const_constructors
          Padding(
            padding: const EdgeInsets.all(10),
            child: GestureDetector(
                onTap: () {
                  deleteData();
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => const Sign()));
                },
                child: Text(
                  "logout",
                  style: TextStyle(fontSize: 20),
                )),
          )
        ],
        title: Text("صفحه التحكم ", style: style),

        backgroundColor: Color.fromARGB(255, 87, 11, 239),

        foregroundColor: Color.fromARGB(255, 245, 242, 242),
        //put the title in the center
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin:
                const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
            //color: Colors.white,
            child: Column(
              children: [
                const Text(
                  "مؤشر كتله الجسم",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.teal),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const BMIMain(),
                      ));
                    },
                    icon: const Icon(Icons.confirmation_num_sharp),
                    label: const Text(
                      "ادخل بياناتك",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 300,
            child: Divider(thickness: 2, color: Colors.tealAccent),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin:
                const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
            //color: Colors.white,
            child: Column(
              children: [
                const Text(
                  "حساب العمر",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.teal),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (_) => const MyAge(),
                      ));
                    },
                    icon: const Icon(Icons.confirmation_num_sharp),
                    label: const Text(
                      "تاريخ ميلادك",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  deleteData() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    setState(() {
      _pref.remove('email');
      _pref.remove('pass');
    });
  }
}

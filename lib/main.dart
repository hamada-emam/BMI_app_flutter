// import 'package:flutter/material.dart';

// import 'app_0/presentation/pages/home_page.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: BMIHomeScreen(),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// import 'app_1/screens/input_page.dart';
// // import 'package:bmi_calculator/screens/input_page.dart';

// void main() => runApp(BMICalculator());

// class BMICalculator extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData.dark().copyWith(
//         primaryColor: Color(0xFF10163B),
//         scaffoldBackgroundColor: Color(0xFF090F32),
//       ),
//       home: InputPage(),
//     );
//   }
// }







import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/homebage.dart';
// import 'homebage.dart';
import 'app/sign/sign_in.dart';

//the main method to invoke the runApp method which the entry point into this project which will be an app
main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences _pref = await SharedPreferences.getInstance();
  var email = _pref.getString("email");
  var password = _pref.getString("pass");
  //run app that is the method to invoke the hole project
  runApp(email != null && password != null
      ? const MaterialApp(
          home: MyApp(),
          //to remove the check banner from the home page that is to inference that into debug mode
          debugShowCheckedModeBanner: false,
        )
      : const MaterialApp(
          // theme: ThemeData(primaryColor: Colors.black, primarySwatch: Colors.teal),
          home: Sign(),
          //to remove the check banner from the home page that is to inference that into debug mode
          debugShowCheckedModeBanner: false,
        ));
}

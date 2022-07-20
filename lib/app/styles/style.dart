import 'package:flutter/material.dart';

// class AppBarStyle extends StatefulWidget {
//   String title_of_app_bar;
//   String action_of_app_bar;
//   Icon x;
//
//   AppBarStyle(this.title_of_app_bar, this.action_of_app_bar, this.x);
//
//   @override
//   State<AppBarStyle> createState() => _AppBarStyleState();
// }
//
// class _AppBarStyleState extends State<AppBarStyle> {
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       title: Text(widget.title_of_app_bar,
//           style: (const TextStyle(
//               color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold))),
//       actions: [
//         TextButton(
//           onPressed: () {},
//           child: Text(widget.action_of_app_bar,
//               style: (const TextStyle(color: Colors.black, fontSize: 20))),
//         ),
//         IconButton(onPressed: () {}, icon: widget.x)
//       ],
//       // to give the app bar a height of the screen
//       elevation: 40,
//       // to give it a shadow
//       shadowColor: Colors.teal,
//       //to give the app bar background color
//       backgroundColor: Colors.teal,
//       // to give all items into app bar the color
//       foregroundColor: Colors.black,
//       //put the title in the center
//       centerTitle: true,
//     );
//   }
// }

var ls = const TextStyle(
    color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold);
//helper text
var hs = const TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontSize: 18,
);
var hsToAll = const TextStyle(
  color: Colors.black,
);
//border side
var bs = const BorderSide(width: 5, color: Colors.green);
var style = const TextStyle(
    fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black);
var style2 = const TextStyle(
    fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white);
var decoration = BoxDecoration(
  borderRadius: BorderRadius.circular(10),
  color: Colors.teal,
);

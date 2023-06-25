// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';

// class LostConnection extends StatefulWidget {
//   const LostConnection({super.key});

//   @override
//   State<LostConnection> createState() => _LostConnectionState();
// }

// class _LostConnectionState extends State<LostConnection> {
  
//   void checkConnectivity() async {
//   var connectivityResult = await Connectivity().checkConnectivity();
//   if (connectivityResult == ConnectivityResult.none) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('No Internet Connection'),
//           content: Text('Please check your internet connection and try again.'),
//           actions: [
//             TextButton(
//               child: Text('OK'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
//   @override
//   Widget build(BuildContext context) {
//     return  Container(child: checkConnectivity(),)
//   }
// }

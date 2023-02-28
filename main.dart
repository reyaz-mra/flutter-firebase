// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


import 'screens/login.dart';
import 'screens/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
// void main() async {
//   //  runApp(MaterialApp(
//     WidgetsFlutterBinding.ensureInitialized();
//     await Firebase.initializeApp();
//     runApp( Signup());
//       initialRoute: '/register',
//       routes: {
//         '/login': (context) => Login(),
//         '/register': (context) => Signup(),
//         '/dashboard': (context) => WelcomeScreen(),
//       },
//   // )
//   // );
// }
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application. 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Login(),
    );
  }
}
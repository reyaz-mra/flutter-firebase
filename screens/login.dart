// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginfirebase/screens/welcome.dart';
import 'package:loginfirebase/services/AuthenticationService.dart';

import 'signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _key = GlobalKey<FormState>();

  final AuthenticationServices _auth = AuthenticationServices();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override

  // String _email="";
  // String password="";

  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 76, 76, 76),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                width: w,
                height: h*0.3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/backg.jpg"),
                    fit: BoxFit.fitWidth
                  )
                ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              width: w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hello", style: TextStyle(
                    fontSize: 70,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontFamily: GoogleFonts.tajawal().fontFamily
                  ),),
                  Text("Sign into your account", style: TextStyle(color: Colors.white),),
                  SizedBox(height: 30,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          offset: Offset(1,1),
                          color: Colors.black54
                        )
                      ]
                    ),
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          hintText: "username",
                          prefixIcon: Icon(Icons.person, color: Color.fromARGB(255, 76, 76, 76),),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(30)
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)
                        )
                      ),
                      // onChanged: (value){
                      //   setState(() {
                      //     _email = value;
                      //   });
                      // },
                    ),
                  ),
                  SizedBox(height: 20,),
                   Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          offset: Offset(1,1),
                          color: Colors.black54
                        )
                      ]
                    ),
                    child: TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                          hintText: "password",
                          prefixIcon: Icon(Icons.lock, color: Color.fromARGB(255, 76, 76, 76),),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(30)
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)
                        )
                      ),
                    obscureText: true,
                    // onChanged: (value) {
                    //   setState(() {
                    //     password = value;
                    //   });
                    // },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30,),
            InkWell(
              onTap: () {
                loginUser();
              },
              child: Container(
                  width: w*0.45,
                  height: h*0.07,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage("assets/images/backg.webp"),
                      fit: BoxFit.cover
                    )
                  ),
                  child: Center(
                    child: Text("Sign in", style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                      fontFamily: GoogleFonts.roboto().fontFamily
                    ),),
                  ),
              ),
            ),
            SizedBox(height: 0.2*w,),
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account? ", style: TextStyle(
                color: Colors.grey,
                fontSize: 15
            ),),
            InkWell(
              onTap: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Signup()),
                );
              },
              child: Text(" Sign up", style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey
              ),),
            )
              ],
           ),
      
          ],
        ),
      ),
    );
  }
  
  void loginUser() async{
    dynamic authResult = await _auth.loginUser(_emailController.text, _passwordController.text);
    if(authResult == null){
      print("Sigin Error");
    }else{
      _emailController.clear();
      _passwordController.clear();
      // ignore: use_build_context_synchronously
      Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
    }
  }
}
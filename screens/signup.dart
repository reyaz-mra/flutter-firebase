// ignore_for_file: prefer_const_literals_to_create_immutables

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginfirebase/services/AuthenticationService.dart';

import 'login.dart';




class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override

   final _key = GlobalKey<FormState>();

  final AuthenticationServices _auth = AuthenticationServices();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailContoller = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String email="";
  String password="";
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 76, 76, 76),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                width: w,
                height: h*0.3,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/backg.jpg"),
                    fit: BoxFit.fitWidth
                  )
                ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              width: w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome", style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontFamily: GoogleFonts.tajawal().fontFamily
                  ),),
                  const Text("Create your account", style: TextStyle(color: Colors.white),),
                  const SizedBox(height: 25,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey,
                      boxShadow: [
                        const BoxShadow(
                          blurRadius: 10,
                          offset: Offset(1,1),
                          color: Colors.black54
                        )
                      ]
                    ),
                    child: TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                          hintText: "enter name",
                          prefixIcon: const Icon(Icons.person, color: Color.fromARGB(255, 76, 76, 76),),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(30)
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)
                        )
                      ),
                    ),
                  ),
                  const SizedBox(height: 18,),
                   Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey,
                      boxShadow: [
                        const BoxShadow(
                          blurRadius: 10,
                          offset: Offset(1,1),
                          color: Colors.black54
                        )
                      ]
                    ),
                    child: TextFormField(
                      controller: _emailContoller,
                      validator: (value){
                        if(value==null){
                          return "It can't be empty";
                        }else{
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          hintText: "enter email",
                          prefixIcon: const Icon(Icons.email, color: Color.fromARGB(255, 76, 76, 76),),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(30)
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)
                        )
                      ),
                    //    onChanged: (value) {
                    //   setState(() {
                    //     email = value;
                    //   });
                    // },
                    ),
                  ),
                  const SizedBox(height: 18,),
                   Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey,
                      boxShadow: [
                        const BoxShadow(
                          blurRadius: 10,
                          offset: Offset(1,1),
                          color: Colors.black54
                        )
                      ]
                    ),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "create password",
                          prefixIcon: const Icon(Icons.lock, color: Color.fromARGB(255, 76, 76, 76),),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(30)
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)
                        )
                      ),
                    //    onChanged: (value) {
                    //   setState(() {
                    //     password = value;
                    //   });
                    // },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28,),
              // onTap: () async {
              //   try {
              //     final newuser =await  _auth.createUserWithEmailAndPassword(email: email, password: password);
              //     if(newuser!=null){
              //       // ignore: use_build_context_synchronously
              //       Navigator.push(context, MaterialPageRoute(builder: (context)=> const WelcomeScreen()));
              //     }
              //   } catch (e) {
              //     print(e);
              //   }
              //},
              InkWell(
                  onTap: () {
                  // if(_key.currentState!.validate()){
                  //   createUser();
                  // }
                  createUser();
                },
                child: Container(
                    width: w*0.45,
                    height: h*0.07,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/backg.webp"),
                        fit: BoxFit.cover
                      )
                    ),
                    child: Center(
                      child: Text("Sign up", style: TextStyle(
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
                const Text("Already have an account? ", style: TextStyle(
                color: Color.fromRGBO(158, 158, 158, 1),
                fontSize: 15
            ),),
            InkWell(
              onTap: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                );
              },
              child: const Text(" Login", style: TextStyle(
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
  
  void createUser() async{
    dynamic result = await _auth.createNewUser(_nameController.text,_emailContoller.text, _passwordController.text);
    if(result == null){
     print("Email is not valid");
    }else{
      print(result.toString());
      _nameController.clear();
      _emailContoller.clear();
      _passwordController.clear();
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    }
  }
}
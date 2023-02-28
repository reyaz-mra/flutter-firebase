// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loginfirebase/DatabaseManager/DatabaseManager.dart';
import 'package:loginfirebase/services/AuthenticationService.dart';


class WelcomeScreen extends StatefulWidget {
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  // const WelcomeScreen({super.key});
  final AuthenticationServices _auth = AuthenticationServices();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _scoreController = TextEditingController();

  List userProfileData = [];
  
  @override
  void initState(){
    super.initState();
    fetchDatabaseList();
  }
  fetchDatabaseList() async{
    dynamic resultant = await DatabaseManager().getUserList();
    if(resultant == null){
      print("Unable to retrive Data");
    }else{
      setState(() {
        userProfileData = resultant;
        // print(userProfileData.length);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: false,
        actions: [
          ElevatedButton(onPressed: (){
            openDialogBox(context);
          },style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
          ), child: Icon(Icons.edit),),
          ElevatedButton(onPressed: () async{
              await _auth.SignOut().then((result) => Navigator.of(context).pop());
          },style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
          ), child: Icon(Icons.logout_outlined),),
        ],
      ),
       body: Container(
            child: ListView.builder(
                itemCount: userProfileData.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text("Md Reyaz"),
                      //subtitle: Text(userProfileData[index]["gender"]),
                      leading: CircleAvatar(
                        child: Image(
                          image: AssetImage('assets/images/profile.jpeg'),
                        ),
                      ),
                      trailing: Text("500"),
                    ),
                  );
                }
              )
          )
    );
  }
  
openDialogBox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Edit User Details'),
            content: Container(
              height: 150,
              child: Column(
                children: [
                  TextField(
                   controller: _nameController,
                    decoration: InputDecoration(hintText: 'Name'),
                  ),
                  TextField(
                   controller: _genderController,
                    decoration: InputDecoration(hintText: 'Gender'),
                  ),
                  TextField(
                    controller: _scoreController,
                    decoration: InputDecoration(hintText: 'Score'),
                  )
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  //submitAction(context);
                  Navigator.pop(context);
                },
                child: Text('Submit'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              )
            ],
          );
        });
  }
}
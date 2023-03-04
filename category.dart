// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:medcare/theme/theme.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  List<String> images = [];
  List<String> name = ["Gynecologist","Cardiology","Anesthesia","Oncologist","Paediatricians","Diabetologist","Gastroenterologist","Nephrologist","ENT specialist","Physiotheraphy","Orthopedic","Opthalmologist","Ayurveda","Neurology","Internal Medicine","Neonatology","Plastic Surgery","Hematologist","Audiologist","Veterinary","General Surgeon","In -Vitro Fertilization","Urologist","Homoeopath","Psychiatrist","Dermatologist","Endocrinologists","HIV","General Physician","Dentist","Dietetics","Yoga & Naturopathy","Rheumatologist","Stress Counselor","Nutritionist","Speech Therapist","Reproductive Health Specialist","Occupational Therapy","Endodontist","Pulmonologist","Geriatrician","Chiropractic","Sexologist","Vascular Surgeon","Sports Medicine Specialist","Radiologist","Psycho Oncology","Somnologist","Allergist","Optometrist","Neuroradiologist","Psycologist","Aesthetic Physician","Cosmetologist"];

  Icon cusIcon = Icon(Icons.search,color: Colors.white,);
  Widget cusSearchBar = Text("Category");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: this.cusSearchBar,
        actions: [
          IconButton(onPressed: (){
            setState(() {
              if(this.cusIcon.icon == Icons.search){
                this.cusIcon = Icon(Icons.cancel_outlined);
                this.cusSearchBar = TextFormField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: "Search a speciality",
                        enabledBorder: OutlineInputBorder(
                          borderSide:BorderSide(width: 0.7, color: Colors.grey),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                          focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:BorderSide(width: 0.7, color: Colors.grey),
                        ),
                        isDense: true,                      // Added this
                        contentPadding: EdgeInsets.all(8),
                      ),
                  );
              }else{
                  cusIcon = Icon(Icons.search);
                  cusSearchBar = Text("Category");
              }
            }
            );
          }, icon: cusIcon)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(11.0),
              child: Text("Our specialized doctors are below",style: TextStyle(
                color: MyTheme.bluishColor,
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),),
            ),
            Container(
              margin: EdgeInsets.only(left: 11),
              child: Text("Choose accurate doctor as per the specialization")
            ),
            GridView.count(
              crossAxisCount: 2, // decides number of columns
              padding: const EdgeInsets.all(10),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: List.generate(name.length, (index){
                return InkWell(
                      onTap: (){},
                      child: Container(
                        width: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: MyTheme.creamColor,
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 15),
                                child: Image(image: AssetImage("assets/images/cat1.png"))
                              ),
                            // SizedBox(height: 7,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(name[index]),
                              )
                            ],
                          ),
                        )
                      ),
                    );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

/**
 * 
 * Padding(
              padding: EdgeInsets.all(10),
              child: InkWell(
                onTap: (){},
                child: Container(
                  width: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: MyTheme.creamColor,
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          child: Image(image: AssetImage("assets/images/icons.png"))
                        ),
                      // SizedBox(height: 7,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Neurology"),
                        )
                      ],
                    ),
                  )
                ),
              ),
            )
 */
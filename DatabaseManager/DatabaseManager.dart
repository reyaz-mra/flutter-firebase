import 'package:cloud_firestore/cloud_firestore.dart';
class DatabaseManager{
    final CollectionReference profileList = FirebaseFirestore.instance.collection("ProfileInfo");

    Future<void> createUserData(String name, String gender, int score, String uid) async{
        return await profileList.doc(uid).set({
           'name':name,
           'gender':gender,
           'score':score
        });
    }

    Future getUserList() async{
      List itemList = [];
      try {
        await profileList.get().then((QuerySnapshot) {
            QuerySnapshot.docs.forEach((element) {
              itemList.add(element.data());
            });
        });
        return itemList;
      } catch (e) {
        print(e.toString());
        return null;
      }
    }

}
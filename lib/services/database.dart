import 'package:cloud_firestore/cloud_firestore.dart';

class Databaseservice{

  final String uid;
  Databaseservice({required this.uid});

  // collection  refrence
  final CollectionReference brewcollection = FirebaseFirestore.instance.collection('brews') ;

  Future UpdateUserData(String sugars, String name, int strength) async{
    return await brewcollection.doc(uid).set({
      'sugars':sugars,
      'name':name,
      'strength':strength,

    });
  }
}
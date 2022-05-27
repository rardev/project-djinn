import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_djinn/services/info.dart';

class DatabaseService
{
  final String uid;
  DatabaseService({required this.uid});
  //DatabaseService({required this.lid});
  //collection reference
  //final String lid;
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');
  final CollectionReference listCollection = FirebaseFirestore.instance.collection('lists');

  Future updateUserData(String fName, String lName, String username, String phone) async
  {
    return await userCollection.doc(uid).set({
      'first_name' : fName,
      'last_name' : lName,
      'username' : username,
      'phone_number' : phone,
    });
  }

  /*
  Future addToList(String listName, String itemName, [String? itemDescription, String? link]) async
  {
    return await userCollection.doc(uid).collection(listName).doc(itemName).set({
      'description' : itemDescription,
      'link' : link,
    });
  }
   */

  Future createList(String listName, String description, bool isPublic) async
  {
    dynamic viewPermission;
    if(isPublic)
      {
        viewPermission = "ALL";
      }
    else
    {
        viewPermission = uid;
    }
    return await listCollection.doc(listName).set({
      'description' : description,

    });
  }


  //user info list from snapshot
  List<Info> _infoListFromSnapshot(QuerySnapshot snapshot)
  {
    return snapshot.docs.map((doc){
      return Info(
          first_name: doc.get('first_name') ?? '',
          last_name: doc.get('last_name') ?? '',
          username: doc.get('username') ?? '',
          phone_number: doc.get('phone_number') ?? '',
      );
    }).toList();
  }

  //get users stream
  Stream<List<Info>> get users
  {
    return userCollection.snapshots()
        .map(_infoListFromSnapshot);
  }

  /*
  Future retrieveUserData() async
  {
    return await userCollection.doc(uid).get();
  }
  */
}
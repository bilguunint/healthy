import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreProvider {
  Firestore _firestore = Firestore.instance;


  Stream<QuerySnapshot> doctorListByName() {
    return _firestore.collection("Doctors").orderBy('doctorEngName', descending: false).snapshots();
  }

  Stream<QuerySnapshot> othersGoalList() {
    return _firestore
        .collection("users")
        .where('goalAdded', isEqualTo: true)
        .snapshots();
  }
}
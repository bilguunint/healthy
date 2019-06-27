import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healthy/model/doctor.dart';

class DatabaseService {
  final Firestore _db = Firestore.instance;

  Stream<List<DoctorModel>> streamDoctors() {
    var ref = _db.collection("Doctors").orderBy('doctorEngName', descending: false).snapshots();
    return ref.map((list) =>
    list.documents.map((doc) => DoctorModel.fromFirestore(doc))
    );
  }
}
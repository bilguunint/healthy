
import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorModel {
   final String id;
   final String doctorFirstName;
   final String doctorLastName;
   final String doctorDegree;
   final String doctorGender;
   final String doctorSpec;
   final String doctorPhoneNum;
   final String doctorSinceYear;
   final String doctorPhoto;
   final String doctorHospitalName;
   final String doctorCity;
   final String doctorFee;
   final String doctorAddress;
   final String doctorAddrLat;
   final String doctorAddrLong;
   final String doctorDate;

  const DoctorModel({
    this.id, 
    this.doctorAddress,
    this.doctorAddrLat,
    this.doctorAddrLong,
    this.doctorCity,
    this.doctorDate,
    this.doctorDegree,
    this.doctorFee,
    this.doctorFirstName,
    this.doctorGender,
    this.doctorHospitalName,
    this.doctorLastName,
    this.doctorPhoneNum,
    this.doctorPhoto,
    this.doctorSinceYear,
    this.doctorSpec
  });

  factory DoctorModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;
    return DoctorModel(
          id: doc.documentID,
          doctorAddress: data['doctorAddress'],
          doctorAddrLat: data['doctorAddrLat'],
          doctorAddrLong: data['doctorAddrLong'],
          doctorCity: data['doctorCity'],
          doctorDate: data['doctorDate'],
          doctorDegree: data['doctorDegree'],
          doctorFee: data['doctorFee'],
          doctorFirstName: data['doctorFirstName'],
          doctorGender: data['doctorGender'],
          doctorHospitalName: data['doctorHospitalName'],
          doctorLastName: data['doctorLastName'],
          doctorPhoneNum: data['doctorPhoneNum'],
          doctorPhoto: data['doctorPhoto'],
          doctorSinceYear: data['doctorSinceYear'],
          doctorSpec: data['doctorSpec'],
    );
  }
}
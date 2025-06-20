import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class attendance_model {
  String? name;
  String? email;
  int? phone_number;
  String? qrInfo;

  create_attendance(name, email, phone_number, qrInfo) {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("attendance").doc(email);

    Map<String, Object?> studentsDetails = {
      "Name": name,
      "E-mail": email,
      "Phone Number": phone_number,
      "Subject": qrInfo,
    };
    documentReference
        .set(studentsDetails)
        .whenComplete(() => print("Data Stored Successfully"));
  }

  detele_attendance(item) {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("attendance").doc(item);
    documentReference
        .delete()
        .whenComplete(() => print("Deleted Successfully"));
  }

  update_date() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("attendance").doc(name);
    Map<String, Object?> studentsDetails = {
      "Name": name,
      "E-mail": email,
      "Phone Number": phone_number.toString(),
      "Subject": qrInfo,
    };
    documentReference
        .update(studentsDetails)
        .whenComplete(() => print("Data Updated Successfully"));
  }
}

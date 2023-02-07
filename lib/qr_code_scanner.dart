import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';
import 'package:project/models/attendance_model.dart';

import 'models/user_model.dart';

class Scanner extends StatefulWidget {
  @override
  _scanner createState() => _scanner();
}

class _scanner extends State<Scanner> {
  String? _qrInfo = 'Scan a QR/Bar code';
  bool camState = false;
  final db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  String? user_id;
  final store_data = attendance_model();

  fetchUID() {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    user_id = user!.uid;
    return user_id;
  }

  qrCallback(String? code) {
    setState(() {
      camState = false;
      _qrInfo = code;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      camState = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(fetchUID()).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (camState == true) {
                  setState(() {
                    camState = false;
                  });
                } else {
                  setState(() {
                    camState = true;
                  });
                }
              },
              child: Icon(Icons.camera),
            ),
            body: camState
                ? Center(
                    child: SizedBox(
                      height: 1000,
                      width: 500,
                      child: QRBarScannerCamera(
                        onError: (context, error) => Text(
                          error.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.red),
                        ),
                        qrCodeCallback: (code) {
                          qrCallback(code);
                        },
                      ),
                    ),
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Code :" + _qrInfo!,
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                        Container(
                          child: TextButton(
                            child: Text(
                              'Assign Present',
                              style: TextStyle(fontSize: 20.0),
                            ),
                            onPressed: () {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                Map<String, dynamic> data = snapshot.data!
                                    .data() as Map<String, dynamic>;
                                print(data['name']);
                                store_data.create_attendance(
                                    data['name'],
                                    data['email'],
                                    data['phoneNumber'],
                                    _qrInfo);
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ),
          );
        });
  }
}

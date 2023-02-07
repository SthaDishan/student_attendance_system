import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';

class attreport extends StatefulWidget {
  const attreport({super.key});

  @override
  State<attreport> createState() => _attreportState();
}

class _attreportState extends State<attreport> {
  getdata() async {
    var result =
        await FirebaseFirestore.instance.collection("attendance").get();
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Details"), backgroundColor: Colors.grey
          // actions: [
          //   IconButton(
          //     icon: const Icon(Icons.exit_to_app),
          //     onPressed: () {
          //       Navigator.push(context,
          //           MaterialPageRoute(builder: (context) => userdetail()));
          //     },
          //   ),
          // ]
          ),
      body: FutureBuilder(
          future: getdata(),
          builder: (context, dynamic snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.all(8),
                    child: ListTile(
                      title: Text(
                          "Name:${snapshot.data.docs[index]['Name']}\nE-mail:${snapshot.data.docs[index]['E-mail']}\nPhone Number:${snapshot.data.docs[index]['Phone Number']}\nSubject:${snapshot.data.docs[index]['Subject']}"),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}

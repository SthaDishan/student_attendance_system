import 'package:flutter/material.dart';
import 'package:project/Routine.dart';
import 'package:project/controllers/login_controller.dart';
import 'package:project/sidecursor/feedback.dart';

import 'package:project/teacherhome.dart';

import '../details.dart';
import '../login.dart';

class tNavBar extends StatelessWidget {
  auth_control abc = auth_control();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/2.jpg"),
              fit: BoxFit.fill,
            ),
          ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // UserAccountsDrawerHeader(
          //   accountName: Text('Dishan'),
          //   accountEmail: Text('dishan.181409@ncit.edu.np'),
          //   currentAccountPicture: CircleAvatar(
          //     child: ClipOval(
          //       child: Image.asset(
          //         "assets/images/1.jpg",
          //         height: 100,
          //         width: 100,
          //         fit: BoxFit.cover,
          //       ),
          //     ),
          //   ),
          //   decoration: BoxDecoration(
          //       color: Colors.transparent,
          //       image: DecorationImage(
          //         image: AssetImage("assets/images/1.jpg"),
          //         fit: BoxFit.cover,
          //       )),
          // ),
          Divider(),
          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text('Dashboard'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => teacherattendance()));
            },
          ),
          ListTile(
            leading: Icon(Icons.copy),
            title: Text('Routine'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Routine()));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.admin_panel_settings),
            title: Text('Student Details'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => attreport()));
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Exit'),
            onTap: () {
              abc.signOut();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => loginpage()));
            },
          ),
        ],
      ),
    ));
  }
}

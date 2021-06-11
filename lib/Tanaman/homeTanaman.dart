import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uas_tanaman/login_page.dart';
import 'package:uas_tanaman/sign_in.dart';
import 'package:uas_tanaman/Tanaman/item_list.dart';
import 'package:uas_tanaman/Tanaman/addScreenTanaman.dart';
import 'package:uas_tanaman/Jenis/homeJenis.dart';

class HomeSatu extends StatelessWidget {
CollectionReference _tanaman =
      FirebaseFirestore.instance.collection('tanaman');
      FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            'Daftar Tanaman',
            style: TextStyle(color: Colors.white),
          ),
        ),
        drawer: Drawer(
        child: Column(
          children: <Widget>[
            // ignore: missing_required_param
            UserAccountsDrawerHeader(
              accountEmail: Text(
                _auth.currentUser.email,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.teal[500]
                        : Colors.white,
                child: Icon(
                  Icons.people,
                  color: Colors.teal[500],
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.green[500],
              ),
            ),
            ListTile(
              leading: Icon(Icons.grass),
              title: Text("Tanaman"),
              onTap: () {
                // Change the applications state
                print("Tanaman");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeSatu()));
              },
            ),
            ListTile(
              leading: Icon(Icons.category),
              title: Text("Jenis"),
              onTap: () {
                // Change the applications state
                print("Jenis");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeDua()));
              },
            ),
            // ListTile(
            //   leading: Icon(Icons.search),
            //   title: Text("Cari"),
            //   onTap: () {
            //     // Change the applications state
            //     print("Cari");
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => SearchPage()));
            //   },
            // ),
            // Divider(
            //   height: 2.0,
            //   color: Colors.teal[600],
            // ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Sign Out"),
              onTap: () {
                signOutGoogle();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) {
                  return LoginPage();
                }), ModalRoute.withName('/'));
              },
            ),
          ],
        ),
      ),
        floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddScreenTanaman(),
            ),
          );
        },
        backgroundColor: Colors.green,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 40,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: ItemListJenis(),
        ),
      ),
    );
    
  }
}

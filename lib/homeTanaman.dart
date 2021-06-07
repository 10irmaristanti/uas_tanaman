import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'formTanaman.dart';
import 'itemTanaman.dart';
import 'homeJenis.dart';
import 'sign_in.dart';

class HomeSatu extends StatelessWidget {
CollectionReference _pengguna =
      FirebaseFirestore.instance.collection('tanaman');
      FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            'Daftar Tanaman Hias',
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
        body: Column(children: [
      Expanded(

      child: ListView(
        
                children: [
                  StreamBuilder<QuerySnapshot>(
                    stream: _pengguna
                        .orderBy('namaTanaman', descending: false)
                        .snapshots(),
                    builder: (buildContext, snapshot) {
                      return Column(
                        children: snapshot.data.docs
                            .map((e) => ItemCard(
                                  e.data()['namaTanaman'],
                                  e.data()['ukuran'],
                                  e.data()['harga'],
                                  e.data()['stok'],
                                  e.data()['jenis'],
                                  onUpdate: () {
                                    _pengguna.doc(e.id).update({
                                      "stok":
                                          e.data()['stok'] + 1
                                    });
                                  },
                                  onDelete: () {
                                    _pengguna.doc(e.id).delete();
                                  },
                                ))
                            .toList(),
                      );
                    },
                  ),
                  SizedBox(
                    height: 150,
                  )
                ],
              ),
    ),
      SizedBox(
        width: double.infinity,
        child: RaisedButton(
            color: Colors.green,
            child: Text("Tambah Data"),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EntryForm()));
            }),
      ),
    ] 
        )
    );
    
  }
}

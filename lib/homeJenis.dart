import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'formJenis.dart';
import 'itemJenis.dart';
import 'homeJenis.dart';
import 'homeTanaman.dart';
import 'sign_in.dart';

class HomeDua extends StatelessWidget {
CollectionReference _jenis =
      FirebaseFirestore.instance.collection('jenis');
      FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            'Daftar Kategori',
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
              // contoh penggunaan srteam
              // _pengguna.orderBy('age', descending: true).snapshots()
              // _pengguna.where('age', isLessThan: 30).snapshots()
              stream: _jenis.orderBy('jenisTanaman', descending: false).snapshots(),
              builder: (buildContext, snapshot) {
                return Column(
                  children: snapshot.data.docs
                      .map((e) => ItemJenis(
                            e.data()['jenisTanaman'],
                            e.data()['keterangan'],
                            // onUpdate: () {
                            //   _kategori.doc(e.id).update({
                            //     "kode": e.data()['jumlahBarang'] + 1
                            //   });
                            // },
                            onDelete: () {
                              _jenis.doc(e.id).delete();
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
                  MaterialPageRoute(builder: (context) => FormJenis()));
            }),
      ),
    ] 
        )
    );
    
  }
}

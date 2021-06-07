//import 'package:firestore_example/contoh_sederhana/item_card.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'itemTanaman.dart';

class MainPage extends StatelessWidget {
  final TextEditingController namaTanamanController = TextEditingController();
  final TextEditingController ukuranController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();
  final TextEditingController stokController = TextEditingController();
  final TextEditingController jenisController = TextEditingController();
  CollectionReference _pengguna =
      FirebaseFirestore.instance.collection('tanaman');

  void clearInputText() {
    namaTanamanController.text = "";
    ukuranController.text = "";
    hargaController.text = "";
    stokController.text = "";
    jenisController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade900,
          title: Text('Firestore Demo'),
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Align(
                alignment: Alignment.topCenter,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(-5, 0),
                        blurRadius: 15,
                        spreadRadius: 3)
                  ]),
                  width: double.infinity,
                  height: 250,
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 160,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextField(
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                              controller: namaTanamanController,
                              decoration: InputDecoration(
                                  hintText: "Isi Nama Tanaman",
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16)),
                            ),
                            TextField(
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                              controller: ukuranController,
                              decoration: InputDecoration(
                                  hintText: "Isi Ukuran",
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16)),
                            ),
                            TextField(
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                              controller: hargaController,
                              decoration: InputDecoration(
                                  hintText: "Isi Harga",
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16)),
                              keyboardType: TextInputType.number,
                            ),
                            TextField(
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                              controller: stokController,
                              decoration: InputDecoration(
                                  hintText: "Isi Stok",
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16)),
                              keyboardType: TextInputType.number,
                            ),
                            TextField(
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                              controller: jenisController,
                              decoration: InputDecoration(
                                  hintText: "Isi Jenis",
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 130,
                        width: 130,
                        padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
                        child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            color: Colors.blue.shade900,
                            child: Text(
                              'Add Data',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () async {
                              // TODO 1 ADD DATA HERE
                              await _pengguna.add({
                                "namaTanaman": namaTanamanController.text,
                                "ukuran": ukuranController.text,
                                "harga": double.tryParse(
                                    hargaController.text),
                                "stok": double.tryParse(stokController.text),
                                "jenis": jenisController.text,
                              });
                              clearInputText();
                            }),
                      ),
                    ],
                  ),
                )),
            Expanded(
              child: ListView(
                children: [
                  // TODO 2 VIEW, update , and delete DATA HERE
                  /// hanya get sekali saja jika menggunakan FutureBuilder
                  /*
                  FutureBuilder<QuerySnapshot>(
                    future: _pengguna.get(),
                    builder: (buildContext, snapshot) {
                      return Column(
                        children: snapshot.data!.docs
                            .map((e) =>
                                ItemCard(e.data()['name'], e.data()['age']))
                            .toList(),
                      );
                    },
                  ),
                  */

                  // get secara realtime jikga menggunakan stream builder
                  StreamBuilder<QuerySnapshot>(
                    // contoh penggunaan srteam
                    // _pengguna.orderBy('age', descending: true).snapshots()
                    // _pengguna.where('age', isLessThan: 30).snapshots()
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
          ],
        ));
  }
}

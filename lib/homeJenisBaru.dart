import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Jenis/item_list.dart';
import 'package:uas_tanaman/Jenis/addScreenKategori.dart';

//pendukung program asinkron
class HomeJenis extends StatefulWidget {
  @override
  HomeJenisState createState() => HomeJenisState();
}

class HomeJenisState extends State<HomeJenis> {
  @override
  CollectionReference _jenis =
      FirebaseFirestore.instance.collection('jenis');
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: CustomColors.firebaseNavy,
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: CustomColors.firebaseNavy,
        // title: AppBarTitle(),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddScreen(),
            ),
          );
        },
        // backgroundColor: CustomColors.firebaseOrange,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 32,
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
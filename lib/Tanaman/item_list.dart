import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uas_tanaman/Tanaman/databaseTanaman.dart';
import 'package:uas_tanaman/Tanaman/editScreenTanaman.dart';

class ItemListJenis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Database.readItems(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        } else if (snapshot.hasData || snapshot.data != null) {
          return ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 16.0),
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index) {
              var noteInfo = snapshot.data.docs[index].data();
              String docID = snapshot.data.docs[index].id;
              String namaTanaman = noteInfo['namaTanaman'];
              String ukuran = noteInfo['ukuran'];
              double harga = noteInfo['harga'];
              double stok = noteInfo['stok'];
              String jenis = noteInfo['jenis'];

              return Card(
                // decoration: BoxDecoration(
                //   // color: CustomColors.firebaseGrey.withOpacity(0.1),
                //   borderRadius: BorderRadius.circular(8.0),
                // ),
                color: Colors.white,
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EditScreenTanaman(
                        currentnamaTanaman: namaTanaman,
                        currentukuran: ukuran,
                        currentharga: harga,
                        currentstok: stok,
                        currentjenis: jenis,
                        documentId: docID,
                      ),
                    ),
                  ),
                  title: Text(
                    namaTanaman,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    "Ukuran : "+ukuran + "\nHarga : " + "$harga" + "\nStok : " + "$stok" + "\nJenis : " + jenis,
                    // maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              );
            },
          );
        }

        return Center(
          child: CircularProgressIndicator(
              // valueColor: AlwaysStoppedAnimation<Color>(
              //   CustomColors.firebaseOrange,
              // ),
              ),
        );
      },
    );
  }
}
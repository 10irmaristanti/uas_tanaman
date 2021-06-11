import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('tanaman');

class Database {
  static String userUid;

  static Future<void> addItemTanaman({
    String namaTanaman,
    String ukuran,
    double harga,
    double stok,
    String jenis,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid);

    Map<String, dynamic> data = <String, dynamic>{
      "namaTanaman": namaTanaman,
      "ukuran": ukuran,
      "harga" : harga,
      "stok" : stok,
      "jenis" : jenis,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Note item added to the database"))
        .catchError((e) => print(e));
  }

  static Future<void> updateItem({
    String namaTanaman,
    String ukuran,
    double harga,
    double stok,
    String jenis,
    String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "namaTanaman": namaTanaman,
      "ukuran": ukuran,
      "harga" : harga,
      "stok" : stok,
      "jenis" : jenis,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Note item updated in the database"))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readItems() {
    CollectionReference notesItemCollection =
        _mainCollection;

    return notesItemCollection.snapshots();
  }

  static Future<void> deleteItem({
    String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Note item deleted from the database'))
        .catchError((e) => print(e));
  }
}
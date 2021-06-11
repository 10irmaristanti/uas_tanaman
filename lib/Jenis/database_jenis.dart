import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('jenis');

class Database {
  static String userUid;

  static Future<void> addItem({
    String jenisTanaman,
    String keterangan,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid);

    Map<String, dynamic> data = <String, dynamic>{
      "jenisTanaman": jenisTanaman,
      "keterangan": keterangan,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Note item added to the database"))
        .catchError((e) => print(e));
  }

  static Future<void> updateItem({
    String jenisTanaman,
    String keterangan,
    String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "jenisTanaman": jenisTanaman,
      "keterangan": keterangan,
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
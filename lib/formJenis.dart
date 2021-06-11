import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'Jenis/homeJenis.dart';
import 'item.dart';

class FormJenis extends StatefulWidget {
  // final Item item;
  // EntryForm(this.item);

  @override
  _FormJenisState createState() => _FormJenisState();
}

//class controller
class _FormJenisState extends State<FormJenis> {
  Item item;
  // EntryFormState(this.item);
  final TextEditingController jenisTanamanController = TextEditingController();
  final TextEditingController keteranganController = TextEditingController();
  CollectionReference _jenis =
      FirebaseFirestore.instance.collection('jenis');
     
      void clearInputText() {
    jenisTanamanController.text = "";
    keteranganController.text = "";
  }
  String dropdownValue = 'Air';
  bool status = false;
  @override
  Widget build(BuildContext context) {
    //kondisi
    // if (item != null) {
    // namaTanamanController.text = "";
    // ukuranController.text = "";
    // hargaController.text = "";
    // stokController.text = "";
    // jenisController.text = "";
    //   if(item.valueDropdown == ""){
    //     item.valueDropdown == "Air";
    //   }else{
    //     if(status == true){
    //       item.valueDropdown = dropdownValue;
    //     }else {
    //       dropdownValue = item.valueDropdown;
    //     }
    //   }
    // }
    //rubah
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: item == null ? Text('Tambah') : Text('Ubah'),
          leading: Icon(Icons.keyboard_arrow_left),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
          child: ListView(
            children: <Widget>[
              // nama
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: jenisTanamanController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Jenis Tanaman',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: keteranganController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Keterangan',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),
    //         
              // tombol button
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Row(
                  children: <Widget>[
                    // tombol simpan
                    Expanded(
                      child: RaisedButton(
                        color: Colors.green,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Simpan',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () async {
                              // TODO 1 ADD DATA HERE
                              await _jenis.add({
                                "jenisTanaman": jenisTanamanController.text,
                                "keterangan": keteranganController.text,
                              });
                              clearInputText();
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Container(
                      width: 5.0,
                    ),
                    // tombol batal
                    Expanded(
                      child: RaisedButton(
                        color: Colors.green,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Cancel',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          Navigator.pop(
                           context,
                            MaterialPageRoute(
                                builder: (context) => HomeDua()));
                        },
                        
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'homeTanaman.dart';
import 'item.dart';

class EntryForm extends StatefulWidget {
  // final Item item;
  // EntryForm(this.item);

  @override
  _EntryFormState createState() => _EntryFormState();
}

//class controller
class _EntryFormState extends State<EntryForm> {
  Item item;
  // EntryFormState(this.item);
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
                  controller: namaTanamanController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Nama Tanaman',
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
                  controller: ukuranController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Ukuran',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),
    //         DropdownButton<String>(
    //   value: dropdownValue,
    //   icon: const Icon(Icons.arrow_downward),
    //   iconSize: 24,
    //   elevation: 16,
    //   style: const TextStyle(color: Colors.blueGrey),
    //   underline: Container(
    //     height: 2,
    //     color: Colors.green,
    //   ),
    //   onChanged: (String newValue) {
    //     setState(() {
    //       dropdownValue = newValue;
    //       status = true;
    //     });
    //   },
    //   items: <String>['kecil', 'medium', 'besar']
    //       .map<DropdownMenuItem<String>>((String value) {
    //     return DropdownMenuItem<String>(
    //       value: value,
    //       child: Text(value),
    //     );
    //   }).toList(),
    // ),
              // harga
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: hargaController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Harga',
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
                  controller: stokController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Stok',
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
                  controller: jenisController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Jenis',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),
              
    //            DropdownButton<String>(
    //   value: dropdownValue,
    //   icon: const Icon(Icons.arrow_downward),
    //   iconSize: 24,
    //   elevation: 16,
    //   style: const TextStyle(color: Colors.blueGrey),
    //   underline: Container(
    //     height: 2,
    //     color: Colors.green,
    //   ),
    //   onChanged: (String newValue) {
    //     setState(() {
    //       dropdownValue = newValue;
    //       status = true;
    //     });
    //   },
    //   items: <String>['Air', 'Merambat', 'Tanah']
    //       .map<DropdownMenuItem<String>>((String value) {
    //     return DropdownMenuItem<String>(
    //       value: value,
    //       child: Text(value),
    //     );
    //   }).toList(),
    // ),
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
                              await _pengguna.add({
                                "namaTanaman": namaTanamanController.text,
                                "ukuran": ukuranController.text,
                                "harga": double.tryParse(
                                    hargaController.text),
                                "stok": double.tryParse(stokController.text),
                                "jenis": jenisController.text,
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
                                builder: (context) => HomeSatu()));
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
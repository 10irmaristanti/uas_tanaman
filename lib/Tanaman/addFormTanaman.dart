import 'package:flutter/material.dart';
import 'package:uas_tanaman/Tanaman/databaseTanaman.dart';
import 'customFormFieldTanaman.dart';

class AddKategori extends StatefulWidget {
  final FocusNode namaTanamanFocusNode;
  final FocusNode ukuranFocusNode;
  final FocusNode hargaFocusNode;
  final FocusNode stokFocusNode;
  final FocusNode jenisFocusNode;

  const AddKategori({
    this.namaTanamanFocusNode,
    this.ukuranFocusNode,
    this.hargaFocusNode,
    this.stokFocusNode,
    this.jenisFocusNode,
  });

  @override
  _AddKategoriState createState() => _AddKategoriState();
}

class _AddKategoriState extends State<AddKategori> {
  final _addItemFormKey = GlobalKey<FormState>();

  bool _isProcessing = false;

  final TextEditingController _namaTanamanController = TextEditingController();
  final TextEditingController _ukuranController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();
  final TextEditingController _stokController = TextEditingController();
  final TextEditingController _jenisController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return 
    Form(
      key: _addItemFormKey,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
              bottom: 24.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.0),
                Text(
                  'Nama Tanaman',
                  style: TextStyle(
                    fontSize: 12.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 2.0),
                 Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: TextField(
                  controller: _namaTanamanController,
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
            //  SizedBox(height: 18.0),
                Text(
                  'Ukuran',
                  style: TextStyle(
                    fontSize: 12.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // SizedBox(height: 8.0),
                Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: TextField(
                  controller: _ukuranController,
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
              // SizedBox(height: 18.0),
                Text(
                  'Harga',
                  style: TextStyle(
                    fontSize: 12.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: TextField(
                  controller: _hargaController,
                  keyboardType: TextInputType.text,
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
              // SizedBox(height: 18.0),
                Text(
                  'Stok',
                  style: TextStyle(
                    fontSize: 12.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // SizedBox(height: 8.0),
                Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: TextField(
                  controller: _stokController,
                  keyboardType: TextInputType.text,
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
              // SizedBox(height: 18.0),
                Text(
                  'Jenis',
                  style: TextStyle(
                    fontSize: 12.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // SizedBox(height: 8.0),
                Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: TextField(
                  controller: _jenisController,
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
              
          _isProcessing
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CircularProgressIndicator(),
                )
              : Container(
                  width: double.maxFinite,
                  child: RaisedButton(
                    color : Colors.green,
                    // style: ButtonStyle(
                    //   shape: MaterialStateProperty.all(
                    //     RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(10),
                    //     ),
                    //   ),
                    // ),
                    onPressed: () async {
                      widget.namaTanamanFocusNode.unfocus();
                      widget.ukuranFocusNode.unfocus();
                      widget.hargaFocusNode.unfocus();
                      widget.stokFocusNode.unfocus();
                      widget.jenisFocusNode.unfocus();

                      if (_addItemFormKey.currentState.validate()) {
                        setState(() {
                          _isProcessing = true;
                        });

                        await Database.addItemTanaman(
                            namaTanaman: _namaTanamanController.text,
                            ukuran: _ukuranController.text,
                            harga: double.parse(_hargaController.text),
                            stok: double.parse(_stokController.text),
                            jenis: _jenisController.text,
                        );

                        setState(() {
                          _isProcessing = false;
                        });

                        Navigator.of(context).pop();
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 14.0, bottom: 14.0),
                      child: Text(
                        'ADD ITEM',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    ),
        ]
      )
    );
  }
}
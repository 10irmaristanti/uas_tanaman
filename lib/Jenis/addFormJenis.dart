import 'package:flutter/material.dart';
import 'package:uas_tanaman/Jenis/database_jenis.dart';
import 'customFormField.dart';

class AddKategori extends StatefulWidget {
  final FocusNode jenisTanamanFocusNode;
  final FocusNode keteranganFocusNode;

  const AddKategori({
    this.jenisTanamanFocusNode,
    this.keteranganFocusNode,
  });

  @override
  _AddKategoriState createState() => _AddKategoriState();
}

class _AddKategoriState extends State<AddKategori> {
  final _addItemFormKey = GlobalKey<FormState>();

  bool _isProcessing = false;

  final TextEditingController _jenisTanamanController = TextEditingController();
  final TextEditingController _keteranganController = TextEditingController();

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
                SizedBox(height: 18.0),
                Text(
                  'Jenis Tanaman',
                  style: TextStyle(
                    fontSize: 18.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                 Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: _jenisTanamanController,
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
                // CustomFormField(
                //   isLabelEnabled: false,
                //   controller: _jenisTanamanController,
                //   focusNode: widget.jenisTanamanFocusNode,
                //   keyboardType: TextInputType.text,
                //   inputAction: TextInputAction.next,
                //   label: 'Jenis Tanaman',
                //   hint: 'Enter Jenis Tanaman',
                // ),
                // SizedBox(height: 24.0),
                Text(
                  'Keterangan',
                  style: TextStyle(
                    fontSize: 18.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: _keteranganController,
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
          //       CustomFormField(
          //         maxLines: 10,
          //         isLabelEnabled: false,
          //         controller: _keteranganController
          //         ,
          //         focusNode: widget.keteranganFocusNode,
          //         keyboardType: TextInputType.number,
          //         inputAction: TextInputAction.done,
          //         label: 'Keterangan',
          //         hint: 'Enter Keterangan',
          //       ),
          //     ],
          //   ),
          // ),
          _isProcessing
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CircularProgressIndicator(),
                )
              : Container(
                  width: double.maxFinite,
                  child: RaisedButton(
                    color: Colors.green,
                    onPressed: () async {
                      widget.jenisTanamanFocusNode.unfocus();
                      widget.keteranganFocusNode.unfocus();

                      if (_addItemFormKey.currentState.validate()) {
                        setState(() {
                          _isProcessing = true;
                        });

                        await Database.addItem(
                            jenisTanaman: _jenisTanamanController.text,
                            keterangan: _keteranganController.text,
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
                          color : Colors.white,
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
import 'package:flutter/material.dart';
import 'package:uas_tanaman/Tanaman/databaseTanaman.dart';
import 'customFormFieldTanaman.dart';

class EditItemForm extends StatefulWidget {
  final FocusNode namaTanamanFocusNode;
  final FocusNode ukuranFocusNode;
  final FocusNode hargaFocusNode;
  final FocusNode stokFocusNode;
  final FocusNode jenisFocusNode;
  final String currentnamaTanaman;
  final String currentukuran;
  final double currentharga;
  final double currentstok;
  final String currentjenis;
  final String documentId;

  const EditItemForm({
    this.namaTanamanFocusNode,
    this.ukuranFocusNode,
    this.hargaFocusNode,
    this.stokFocusNode,
    this.jenisFocusNode,
    this.currentnamaTanaman,
    this.currentukuran,
    this.currentharga,
    this.currentstok,
    this.currentjenis,
    this.documentId,
  });

  @override
  _EditItemFormState createState() => _EditItemFormState();
}

class _EditItemFormState extends State<EditItemForm> {
  final _editItemFormKey = GlobalKey<FormState>();

  bool _isProcessing = false;

   TextEditingController _namaTanamanController = TextEditingController();
   TextEditingController _ukuranController = TextEditingController();
   TextEditingController _hargaController = TextEditingController();
   TextEditingController _stokController = TextEditingController();
   TextEditingController _jenisController = TextEditingController();

  @override
  void initState() {
    _namaTanamanController = TextEditingController(
      text: widget.currentnamaTanaman,
    );

    _ukuranController = TextEditingController(
      text: widget.currentukuran.toString(),
    );
    _hargaController = TextEditingController(
      text: widget.currentharga.toString(),
    );
    _stokController = TextEditingController(
      text: widget.currentstok.toString(),
    );
    _jenisController = TextEditingController(
      text: widget.currentjenis.toString(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _editItemFormKey,
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
                  'Title',
                  style: TextStyle(
                    // color: CustomColors.firebaseGrey,
                    fontSize: 16.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                CustomFormField(
                  isLabelEnabled: false,
                  controller: _namaTanamanController,
                  focusNode: widget.namaTanamanFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  // validator: (value) => Validator.validateField(
                  //   value: value,
                  // ),
                  label: 'Nama Tanaman',
                  hint: 'Enter Nama Tanaman',
                ),
                // SizedBox(height: 24.0),
                Text(
                  'Ukuran',
                  style: TextStyle(
                    // color: CustomColors.firebaseGrey,
                    fontSize: 16.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                CustomFormField(
                  isLabelEnabled: false,
                  controller: _ukuranController,
                  focusNode: widget.ukuranFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  // validator: (value) => Validator.validateField(
                  //   value: value,
                  // ),
                  label: 'Ukuran',
                  hint: 'Enter Ukuran',
                ),
                // SizedBox(height: 24.0),
                Text(
                  'Harga',
                  style: TextStyle(
                    // color: CustomColors.firebaseGrey,
                    fontSize: 16.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                CustomFormField(
                  isLabelEnabled: false,
                  controller: _hargaController,
                  focusNode: widget.hargaFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  // validator: (value) => Validator.validateField(
                  //   value: value,
                  // ),
                  label: 'Harga',
                  hint: 'Enter Harga',
                ),
                // SizedBox(height: 24.0),
                Text(
                  'Stok',
                  style: TextStyle(
                    // color: CustomColors.firebaseGrey,
                    fontSize: 16.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                CustomFormField(
                  isLabelEnabled: false,
                  controller: _stokController,
                  focusNode: widget.stokFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  // validator: (value) => Validator.validateField(
                  //   value: value,
                  // ),
                  label: 'Stok',
                  hint: 'Enter Stok',
                ),
                // SizedBox(height: 24.0),
                Text(
                  'Jenis',
                  style: TextStyle(
                    // color: CustomColors.firebaseGrey,
                    fontSize: 16.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                CustomFormField(
                  isLabelEnabled: false,
                  controller: _jenisController,
                  focusNode: widget.jenisFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  // validator: (value) => Validator.validateField(
                  //   value: value,
                  // ),
                  label: 'Jenis',
                  hint: 'Enter Jenis',
                ),
                
              ],
            ),
          ),
          
          _isProcessing
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CircularProgressIndicator(
                    // valueColor: AlwaysStoppedAnimation<Color>(
                    //   CustomColors.firebaseOrange,
                    // ),
                  ),
                )
              : Container(
                  width: double.maxFinite,
                  child: RaisedButton(
                    color: Colors.green,
                    // style: ButtonStyle(
                    //   // backgroundColor: MaterialStateProperty.all(
                    //   //   CustomColors.firebaseOrange,
                    //   // ),
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

                      if (_editItemFormKey.currentState.validate()) {
                        setState(() {
                          _isProcessing = true;
                        });

                        await Database.updateItem(
                          docId: widget.documentId,
                          namaTanaman : _namaTanamanController.text,
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
                        'UPDATE ITEM',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          // color: CustomColors.firebaseGrey,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
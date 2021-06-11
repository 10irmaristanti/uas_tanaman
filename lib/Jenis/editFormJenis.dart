import 'package:flutter/material.dart';
import 'package:uas_tanaman/Jenis/database_jenis.dart';
import 'customFormField.dart';

class EditItemForm extends StatefulWidget {
  final FocusNode jenisTanamanFocusNode;
  final FocusNode keteranganFocusNode;
  final String currentjenisTanaman;
  final String currentketerangan;
  final String documentId;

  const EditItemForm({
    this.jenisTanamanFocusNode,
    this.keteranganFocusNode,
    this.currentjenisTanaman,
    this.currentketerangan,
    this.documentId,
  });

  @override
  _EditItemFormState createState() => _EditItemFormState();
}

class _EditItemFormState extends State<EditItemForm> {
  final _editItemFormKey = GlobalKey<FormState>();

  bool _isProcessing = false;

  TextEditingController _jenisTanamanController = TextEditingController();
  TextEditingController _keteranganController  = TextEditingController();

  @override
  void initState() {
    _jenisTanamanController = TextEditingController(
      text: widget.currentjenisTanaman,
    );

    _keteranganController = TextEditingController(
      text: widget.currentketerangan.toString(),
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
                  'Jenis Tanaman',
                  style: TextStyle(
                    // color: CustomColors.firebaseGrey,
                    fontSize: 18.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                CustomFormField(
                  isLabelEnabled: false,
                  controller: _jenisTanamanController,
                  focusNode: widget.jenisTanamanFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  // validator: (value) => Validator.validateField(
                  //   value: value,
                  // ),
                  label: 'Jenis Tanaman',
                  hint: 'Enter Jenis Tanaman',
                ),
                  SizedBox(height: 18.0),
                Text(
                  'Keterangan',
                  style: TextStyle(
                    // color: CustomColors.firebaseGrey,
                    fontSize: 18.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                CustomFormField(
                  isLabelEnabled: false,
                  controller: _keteranganController,
                  focusNode: widget.jenisTanamanFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  // validator: (value) => Validator.validateField(
                  //   value: value,
                  // ),
                  label: 'Keterangan',
                  hint: 'Enter Keterangan',
                ),
                // SizedBox(height: 10.0),
                // Text(
                //   'Keterangan',
                //   style: TextStyle(
                //     // color: CustomColors.firebaseGrey,
                //     fontSize: 22.0,
                //     letterSpacing: 1,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                // SizedBox(height: 8.0),
                // CustomFormField(
                //   maxLines: 10,
                //   isLabelEnabled: false,
                //   controller: _keteranganController,
                //   focusNode: widget.keteranganFocusNode,
                //   keyboardType: TextInputType.number,
                //   inputAction: TextInputAction.done,
                //   // validator: (value) => Validator.validateField(
                //   //   value: value,
                //   // ),
                //   label: 'Keterangan',
                //   hint: 'Enter Keterangan',
                // ),
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
                    color : Colors.green,
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
                      widget.jenisTanamanFocusNode.unfocus();
                      widget.keteranganFocusNode.unfocus();

                      if (_editItemFormKey.currentState.validate()) {
                        setState(() {
                          _isProcessing = true;
                        });

                        await Database.updateItem(
                          docId: widget.documentId,
                          jenisTanaman : _jenisTanamanController.text,
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
                        'UPDATE ITEM',
                        style: TextStyle(
                          color:  Colors.white,
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
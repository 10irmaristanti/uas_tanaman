import 'package:flutter/material.dart';
import 'package:uas_tanaman/Tanaman/databaseTanaman.dart';
import 'editFormTanaman.dart';

class EditScreenTanaman extends StatefulWidget {
  final String currentnamaTanaman;
  final String currentukuran;
  final double currentharga;
  final double currentstok;
  final String currentjenis;
  final String documentId;

  EditScreenTanaman({
    this.currentnamaTanaman,
    this.currentukuran,
    this.currentharga,
    this.currentstok,
    this.currentjenis,
    this.documentId,
  });

  @override
  _EditScreenTanamanState createState() => _EditScreenTanamanState();
}

class _EditScreenTanamanState extends State<EditScreenTanaman> {
  final FocusNode _namaTanamanFocusNode = FocusNode();

  final FocusNode _ukuranFocusNode = FocusNode();

  final FocusNode _hargaFocusNode = FocusNode();

  final FocusNode _stokFocusNode = FocusNode();

  final FocusNode _jenisFocusNode = FocusNode();

  bool _isDeleting = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _namaTanamanFocusNode.unfocus();
        _ukuranFocusNode.unfocus();
        _hargaFocusNode.unfocus();
        _stokFocusNode.unfocus();
        _jenisFocusNode.unfocus();
      },
      child: Scaffold(
        // backgroundColor: CustomColors.firebaseNavy,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.green,
          title: Text(
            'Form Edit'
          ),
          actions: [
            _isDeleting
                ? Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      bottom: 10.0,
                      right: 16.0,
                    ),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.redAccent,
                      ),
                      strokeWidth: 3,
                    ),
                  )
                : IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.redAccent,
                      size: 32,
                    ),
                    onPressed: () async {
                      setState(() {
                        _isDeleting = true;
                      });

                      await Database.deleteItem(
                        docId: widget.documentId,
                      );

                      setState(() {
                        _isDeleting = false;
                      });

                      Navigator.of(context).pop();
                    },
                  ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: EditItemForm(
              documentId: widget.documentId,
              namaTanamanFocusNode: _namaTanamanFocusNode,
              ukuranFocusNode: _ukuranFocusNode,
              hargaFocusNode: _hargaFocusNode,
              stokFocusNode: _stokFocusNode,
              jenisFocusNode: _jenisFocusNode,
              currentnamaTanaman :widget.currentnamaTanaman,
              currentukuran: widget.currentukuran,
              currentharga: widget.currentharga,
              currentstok: widget.currentstok,
              currentjenis: widget.currentjenis,
            ),
          ),
        ),
      ),
    );
  }
}
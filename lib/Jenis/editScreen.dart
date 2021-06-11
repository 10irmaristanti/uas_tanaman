import 'package:flutter/material.dart';
import 'package:uas_tanaman/Jenis/database_jenis.dart';
import 'editFormJenis.dart';

class EditScreenKategori extends StatefulWidget {
  final String currentjenisTanaman;
  final String currentketerangan;
  final String documentId;

  EditScreenKategori({
    this.currentjenisTanaman,
    this.currentketerangan,
    this.documentId,
  });

  @override
  _EditScreenKategoriState createState() => _EditScreenKategoriState();
}

class _EditScreenKategoriState extends State<EditScreenKategori> {
  final FocusNode _jenisTanamanFocusNode = FocusNode();

  final FocusNode _keteranganFocusNode = FocusNode();

  bool _isDeleting = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _jenisTanamanFocusNode.unfocus();
        _keteranganFocusNode.unfocus();
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
              jenisTanamanFocusNode: _jenisTanamanFocusNode,
              keteranganFocusNode: _keteranganFocusNode,
              currentjenisTanaman :widget.currentjenisTanaman,
              currentketerangan: widget.currentketerangan,
            ),
          ),
        ),
      ),
    );
  }
}
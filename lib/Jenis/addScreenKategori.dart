import 'package:flutter/material.dart';
import 'package:uas_tanaman/Jenis/addFormJenis.dart';


class AddScreen extends StatelessWidget {
  final FocusNode _titleFocusNode = FocusNode();
  final FocusNode _descriptionFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _titleFocusNode.unfocus();
        _descriptionFocusNode.unfocus();
      },
      child: Scaffold(
        // backgroundColor: CustomColors.firebaseNavy,
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            'Form Kategori',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: AddKategori(
              jenisTanamanFocusNode: _titleFocusNode,
              keteranganFocusNode: _descriptionFocusNode,
            ),
          ),
        ),
      ),
    );
  }
}
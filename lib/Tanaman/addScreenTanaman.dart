import 'package:flutter/material.dart';
import 'package:uas_tanaman/Tanaman/addFormTanaman.dart';


class AddScreenTanaman extends StatelessWidget {
  final FocusNode _namaFocusNode = FocusNode();
  final FocusNode _ukuranFocusNode = FocusNode();
  final FocusNode _hargaFocusNode = FocusNode();
  final FocusNode _stokFocusNode = FocusNode();
  final FocusNode _jenisFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _namaFocusNode.unfocus();
        _ukuranFocusNode.unfocus();
        _hargaFocusNode.unfocus();
        _stokFocusNode.unfocus();
        _jenisFocusNode.unfocus();
      },
      child: Scaffold(
        // backgroundColor: CustomColors.firebaseNavy,
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            'Form Tanaman',
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
              namaTanamanFocusNode: _namaFocusNode,
              ukuranFocusNode: _ukuranFocusNode,
              hargaFocusNode: _ukuranFocusNode,
              stokFocusNode: _ukuranFocusNode,
              jenisFocusNode: _ukuranFocusNode,
            ),
          ),
        ),
      ),
    );
  }
}
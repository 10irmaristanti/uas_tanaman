class Item {
  int _id;
  String _namatanaman;
  int _harga;
  // String _kode;
  int _stok;
  String _valueDropdown;

  int get id => _id;

  String get produk => this._namatanaman;
  set produk(String value) => this._namatanaman = value;

  String get valueDropdown => this._valueDropdown;
  set valueDropdown(String value) => this._valueDropdown = value;

  get harga => this._harga;
  set harga(value) => this._harga = value;

  // String get kode => this._kode;
  // set kode(String value) => this._kode = value;

  get stok => this._stok;
  set stok(value) => this._stok = value;

  // konstruktor versi 1
  Item(this._namatanaman, this._harga, this._stok);

  // konstruktor versi 2: konversi dari Map ke Item
  Item.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._namatanaman = map['namatanaman'];
    this._harga = map['harga'];
    // this._kode = map['kode'];
    this._stok = map['stok'];
    this._valueDropdown = map['valueDropdown'];
  }

  // konversi dari Item ke Map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['namatanaman'] = _namatanaman;
    map['harga'] = harga;
    // map['kode'] = kode;
    map['stok'] = stok;
    map['valueDropdown'] = this._valueDropdown;
    return map;
  }
}
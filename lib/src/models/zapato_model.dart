import 'package:flutter/material.dart';

class ZapatoModel with ChangeNotifier {
  String _assetImage = 'assets/imgs/azul.png';
  double _talla = 9;

  String get assetImage => _assetImage;
  double get talla => _talla;

  set assetImage(String imagen) {
    _assetImage = imagen;
    notifyListeners();
  }

  set talla(double talla) {
    _talla = talla;
    notifyListeners();
  }
}

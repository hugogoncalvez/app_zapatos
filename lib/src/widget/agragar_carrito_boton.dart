import 'package:app_shoes/src/widget/imports_widgets.dart';
import 'package:flutter/material.dart';

class AgregarCarritoBoton extends StatelessWidget {
  const AgregarCarritoBoton(
      {Key? key, required this.monto, required this.height})
      : super(key: key);
  final double monto;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(height * 0.008),
      child: Container(
        width: double.infinity,
        height: height * 0.12,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(height * 0.07),
            color: Colors.grey[200]),
        child: Row(
          children: [
            SizedBox(width: height * 0.04),
            Text('\$ $monto',
                style: TextStyle(
                    fontSize: height * 0.035, fontWeight: FontWeight.bold)),
            const Spacer(),
            BotonNaranja(
              texto: 'Add to cart',
              alto: height * 0.05,
              ancho: height * 0.15,
            ),
            SizedBox(width: height * 0.04),
          ],
        ),
      ),
    );
  }
}

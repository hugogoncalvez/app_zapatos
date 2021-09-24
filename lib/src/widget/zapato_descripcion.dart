import 'package:flutter/material.dart';

class ZapatoDescripcion extends StatelessWidget {
  final String titulo;
  final String descripcion;

  const ZapatoDescripcion(
      {Key? key, required this.titulo, required this.descripcion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: height * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: height * 0.01),
          Text(titulo,
              style: TextStyle(
                  fontSize: height * 0.0384, fontWeight: FontWeight.w700)),
          SizedBox(height: height * 0.01),
          Text(
            descripcion,
            style: TextStyle(color: Colors.black54, height: height * 0.002),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class BotonNaranja extends StatelessWidget {
  const BotonNaranja(
      {required this.texto,
      required this.alto,
      required this.ancho,
      this.color = const Color(0xffFE9E0B)});
  final String texto;

  final double alto;
  final double ancho;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Container(
      alignment: Alignment.center,
      width: ancho, //,
      height: alto, // ,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(height * 0.05), color: color),
      child: Text(
        texto,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

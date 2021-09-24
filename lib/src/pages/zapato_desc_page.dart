import 'package:animate_do/animate_do.dart';
import 'package:app_shoes/src/models/zapato_model.dart';
import 'package:flutter/material.dart';
import 'package:app_shoes/src/widget/imports_widgets.dart';
import 'package:provider/provider.dart';

class ZapatoDescripcionPage extends StatelessWidget {
  const ZapatoDescripcionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                const ZapatoZisePreview(fullScreen: true),
                Positioned(
                  top: height * 0.06,
                  child: IconButton(
                      iconSize: height * 0.05,
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.chevron_left)),
                )
              ],
            ),
            Expanded(
                child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  ZapatoDescripcion(
                      descripcion:
                          'The Nike Air Max 720 goes bigger than ever before with Nike\'s taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.',
                      titulo: 'Nike Air Max 720'),
                  _MontoComprarAhora(),
                  _ColoresyMas(),
                  _BotonesSettings(),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class _BotonesSettings extends StatelessWidget {
  const _BotonesSettings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: height * 0.03, vertical: height * 0.03),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _BotonSombreado(
            height: height,
            icono: Icons.favorite,
            color: Colors.red,
          ),
          _BotonSombreado(
            height: height,
            icono: Icons.shopping_cart,
            color: Colors.grey,
          ),
          _BotonSombreado(
            height: height,
            icono: Icons.settings,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}

class _BotonSombreado extends StatelessWidget {
  const _BotonSombreado({
    Key? key,
    required this.height,
    required this.icono,
    required this.color,
  }) : super(key: key);

  final double height;
  final IconData icono;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: height * 0.065,
      height: height * 0.065,
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black12, offset: Offset(2, 5), blurRadius: 10)
          ]),
      child: Icon(
        icono,
        color: color,
      ),
    );
  }
}

class _ColoresyMas extends StatelessWidget {
  const _ColoresyMas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final zapatoModel = Provider.of<ZapatoModel>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: height * 0.03),
      child: Row(
        children: [
          Expanded(
              child: Stack(
            children: [
              Positioned(
                  left: height * 0.09,
                  child: GestureDetector(
                      onTap: () =>
                          zapatoModel.assetImage = 'assets/imgs/verde.png',
                      child: const _BotonColor(
                          color: Color(0xffC6D642), index: 4))),
              Positioned(
                  left: height * 0.06,
                  child: GestureDetector(
                      onTap: () =>
                          zapatoModel.assetImage = 'assets/imgs/amarillo.png',
                      child: const _BotonColor(
                          color: Color(0xffFFAD29), index: 3))),
              Positioned(
                  left: height * 0.03,
                  child: GestureDetector(
                      onTap: () =>
                          zapatoModel.assetImage = 'assets/imgs/azul.png',
                      child: const _BotonColor(
                          color: Color(0xff2099F1), index: 2))),
              GestureDetector(
                  onTap: () => zapatoModel.assetImage = 'assets/imgs/negro.png',
                  child: const _BotonColor(color: Color(0xff364D56), index: 1)),
            ],
          )),
          BotonNaranja(
            texto: 'More related items',
            alto: height * 0.04,
            ancho: height * 0.25,
            color: const Color(0xffFFC675),
          ),
        ],
      ),
    );
  }
}

class _BotonColor extends StatelessWidget {
  const _BotonColor({
    Key? key,
    required this.color,
    required this.index,
  }) : super(key: key);

  final Color color;
  final int index;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return FadeInLeft(
      delay: Duration(milliseconds: index * 100),
      duration: const Duration(milliseconds: 300),
      child: Container(
        width: height * 0.04,
        height: height * 0.04,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      ),
    );
  }
}

class _MontoComprarAhora extends StatelessWidget {
  const _MontoComprarAhora({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: height * 0.02),
      child: Container(
        margin: EdgeInsets.only(top: height * 0.01, bottom: height * 0.01),
        child: Row(
          children: [
            Text(
              '\$ 180.0',
              style: TextStyle(
                  fontSize: height * 0.035, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Bounce(
              delay: const Duration(seconds: 1),
              from: height * 0.01024,
              child: BotonNaranja(
                texto: 'Buy now',
                alto: height * 0.042,
                ancho: height * 0.13,
              ),
            )
          ],
        ),
      ),
    );
  }
}

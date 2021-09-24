import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_shoes/src/models/zapato_model.dart';
import 'package:app_shoes/src/pages/zapato_desc_page.dart';

class ZapatoZisePreview extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const ZapatoZisePreview({this.fullScreen = false});
  final bool fullScreen;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    // height 781.09
    return GestureDetector(
      onTap: () {
        if (!fullScreen) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      const ZapatoDescripcionPage()));
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: (fullScreen) ? height * 0.005 : height * 0.03,
            vertical: (fullScreen) ? height * 0.003 : 0),
        child: Container(
          width: double.infinity,
          height: (fullScreen) ? height * 0.5 : height * 0.58,
          decoration: BoxDecoration(
              color: const Color(0xffFFD54F),
              borderRadius: (fullScreen)
                  ? BorderRadius.only(
                      bottomLeft: Radius.circular(height * 0.035),
                      bottomRight: Radius.circular(height * 0.035),
                      topLeft: Radius.circular(height * 0.02),
                      topRight: Radius.circular(height * 0.02))
                  : BorderRadius.circular(height * 0.035)),
          child: Column(
            children: [
              _ZapatoConSombra(height, fullScreen),
              if (!fullScreen) _ZapatoTallas(height),
            ],
          ),
        ),
      ),
    );
  }
}

class _ZapatoConSombra extends StatelessWidget {
  final double height;
  final bool fullScreen;

  const _ZapatoConSombra(this.height, this.fullScreen);

  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);
    return Padding(
      padding: EdgeInsets.all(height * 0.05),
      child: Stack(
        children: [
          Positioned(
              top: height * 0.15,
              right: 0,
              child: _ZapatoSombra(height: height)),
          Image(image: AssetImage(zapatoModel.assetImage)),
        ],
      ),
    );
  }
}

class _ZapatoTallas extends StatelessWidget {
  final double height;

  const _ZapatoTallas(this.height);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: height * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _TallaZapato(height: height, numero: 7),
          _TallaZapato(height: height, numero: 7.5),
          _TallaZapato(height: height, numero: 8),
          _TallaZapato(height: height, numero: 8.5),
          _TallaZapato(height: height, numero: 9),
          _TallaZapato(height: height, numero: 9.5)
        ],
      ),
    );
  }
}

class _TallaZapato extends StatelessWidget {
  const _TallaZapato({
    required this.height,
    required this.numero,
  });

  final double height;
  final double numero;

  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);
    return GestureDetector(
      onTap: () {
        zapatoModel.talla = numero;
      },
      child: Container(
        alignment: Alignment.center,
        width: height * 0.057611,
        height: height * 0.057611,
        decoration: BoxDecoration(
            color: (numero == zapatoModel.talla)
                ? const Color(0xffF1A23A)
                : Colors.white,
            borderRadius: BorderRadius.circular(height * 0.015),
            boxShadow: [
              if (numero == zapatoModel.talla)
                BoxShadow(
                  color: const Color(0xffEAA14E),
                  blurRadius: height * 0.01,
                )
            ]),
        child: Text(
          numero.toString().replaceAll('.0', ''),
          style: TextStyle(
              color: (numero == zapatoModel.talla)
                  ? Colors.white
                  : const Color(0xffF1A23A),
              fontSize: height * 0.02,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class _ZapatoSombra extends StatelessWidget {
  const _ZapatoSombra({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -height * 0.00075,
      child: Container(
        width: height * 0.3,
        height: height * 0.12,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(height * 0.5),
            boxShadow: [
              BoxShadow(
                color: const Color(0xffEAA14E),
                blurRadius: height * 0.04,
              )
            ]),
      ),
    );
  }
}
//
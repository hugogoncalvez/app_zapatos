import 'package:flutter/material.dart';
import 'package:app_shoes/src/helpers/helpers.dart';

import 'package:app_shoes/src/widget/imports_widgets.dart';

class ZapatoPage extends StatelessWidget {
  const ZapatoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    cambiarColorStatusbar();
    cambiarStatusDark();
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(texto: 'For You'),
          SizedBox(height: height * 0.03),
          Expanded(
              child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: const [
                Hero(
                    tag: 'zapato-1',
                    child: ZapatoZisePreview(fullScreen: false)),
                ZapatoDescripcion(
                    descripcion:
                        'The Nike Air Max 720 goes bigger than ever before with Nike\'s taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.',
                    titulo: 'Nike Air Max 720')
              ],
            ),
          )),
          AgregarCarritoBoton(monto: 180.0, height: height)
        ],
      ),
    );
  }
}

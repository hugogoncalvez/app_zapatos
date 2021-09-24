import 'package:flutter/material.dart';
import 'package:app_shoes/src/models/zapato_model.dart';
import 'package:app_shoes/src/pages/zapato_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => ZapatoModel())],
    child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: ZapatoPage());
  }
}

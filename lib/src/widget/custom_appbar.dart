import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.texto}) : super(key: key);
  final String texto;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: height * 0.03),
        child: Container(
          margin: EdgeInsets.only(top: height * 0.01),
          width: double.infinity,
          child: Row(
            children: [
              Text(
                texto,
                style: TextStyle(
                    fontSize: height * 0.035, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Icon(
                Icons.search,
                size: height * 0.045,
              )
            ],
          ),
        ),
      ),
    );
  }
}

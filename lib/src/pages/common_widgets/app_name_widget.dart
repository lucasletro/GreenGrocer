import 'package:flutter/material.dart';

class AppNameWidget extends StatelessWidget {

  //caso não passe nada esta variavel vai ter o valor nulo(?)
  final Color? greenTitleColor;
  final double textSize;

  const AppNameWidget({
    Key? key,
    this.greenTitleColor,
    this.textSize = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
          style: TextStyle(
            fontSize: textSize,
          ),
          children: [
            TextSpan(
                text: "Green",
                style: TextStyle(
                  //se for nulo ou seja se não passarmos nada a cor é verde
                  color: greenTitleColor ?? Colors.green,
                )),
            const TextSpan(
                text: "Grocer",
                style: TextStyle(
                  color: Colors.red,
                )),
          ]),
    );
  }
}

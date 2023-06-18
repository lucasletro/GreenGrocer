import 'package:flutter/material.dart';

class QuantityWidget extends StatelessWidget {
  final int value; //valor de quantidade
  final String suffixText; //testo ao lado da quantidade (kg, unidade etc...)
  //result precisa receber no parametro uma quantidade
  //de um valor inteiro.
  final Function(int quantity) result;

  const QuantityWidget({
    Key? key,
    required this.suffixText,
    required this.value,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            //sombra
            color: Colors.grey.shade300,
            spreadRadius: 1,
            blurRadius: 2,
          ),
        ],
      ),

      child: Row(
        children: [
          //BOTÃO DE DIMINUIR A QUANTIDADE
          Material(
            child: InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: () {
                if(value == 1){
                  return;
                }
                int resultCount = value - 1;
                result(resultCount);
              },
              child: Ink(
                height: 25,
                width: 25,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.remove,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          ),

          //TEXTO DE QUANTIDADE
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              "$value$suffixText",
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          //BOTÃO DE AUMENTAR A QUANTIDADE
          Material(
            child: InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: () {
                int resultCount = value + 1;
                //result precisa receber no parametro uma quantidade
                //de um valor inteiro entao passamos o resultCount
                result(resultCount);
              },
              child: Ink(
                height: 25,
                width: 25,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

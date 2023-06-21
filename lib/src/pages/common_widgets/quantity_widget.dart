import 'package:flutter/material.dart';

//este widget de quantidade vai ser usado nas classes
//product_screen e cart_tile.

class QuantityWidget extends StatelessWidget {
  final int value; //valor de quantidade
  final String suffixText; //texto ao lado da quantidade (kg, unidade etc...)
  //result precisa receber no parametro uma quantidade
  //de um valor inteiro.
  final Function(int quantity) result;

  final bool isRemovable; //indicar se o botao de quantidade vai ser removivel ou não.

  const QuantityWidget({
    Key? key,
    required this.suffixText,
    required this.value,
    required this.result,
    this.isRemovable = false, //inicialmente este botao nao vai ser removivel
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
        //para que a row cresça o minimo possivel
        mainAxisSize: MainAxisSize.min,
        children: [

          //BOTÃO DE DIMINUIR A QUANTIDADE
          Material(
            child: InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: () {
                //se o valor for 1 e o widget nao for removivel
                //nao acontece nada
                if(value == 1 && !isRemovable){
                  return;
                }
                int resultCount = value - 1;
                result(resultCount);
              },
              child: Ink(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  color: !isRemovable || value > 1 ? Colors.grey : Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  //se o botão não for removivel(isRemovable = false)
                  //ou se aquantidade for maior que 1 apresneta o icone remove.
                  !isRemovable || value > 1 ? Icons.remove : Icons.delete_forever,
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

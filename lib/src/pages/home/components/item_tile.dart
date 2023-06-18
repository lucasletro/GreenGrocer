import 'package:flutter/material.dart';
import 'package:greengrocer/src/models/item_model.dart';
import 'package:greengrocer/src/pages/product/product_screen.dart';
import 'package:greengrocer/src/services/utils_services.dart';

//TILE DOS PRODUTOS QUE VAI SER CHAMADO NO GRID VIEW NA HOME_TAB

class ItemTile extends StatelessWidget {
  ItemTile({
    Key? key,
    required this.item,
  }) : super(key: key);

  final UtilsServices utilsServices = UtilsServices();
  //dentro de itemModel temos todos os dados do produto
  //como nome, imagem, preço etc..
  final ItemModel item;

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [

        //CONTEUDO DO TILE
        GestureDetector(
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (c){
                return ProductScreen(item: item,);
              })
            );
          },

          child: Card(
            elevation: 3,
            color: Colors.white,
            shadowColor: Colors.grey.shade300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),

            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //IMAGEM
                  Expanded(
                      child: Hero( //animaçao ao abri e fechar a imagem.
                        //tag: modo q vamos reconhecer esta imagem ao abrir em outro local
                        tag: item.imgUrl,
                          child: Image.asset(item.imgUrl),
                      ),
                  ),

                  //NOME
                  Text(
                    item.itemName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  //PREÇO - UNIDADE
                  Row(
                    children: [
                      Text(
                        utilsServices.priceToCurrency(item.price),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.green),
                      ),

                      Text(
                          "/${item.unit}",
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

        //BOTÃO DE ADD NO CARRINHO
        Positioned(
          top: 4,
          right: 4,
          child: GestureDetector(
            onTap: (){},
            child: Container(
              height: 40,
              width: 35,
              decoration: const BoxDecoration(
                  color: Colors.green,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  topRight: Radius.circular(20),
                )
              ),
              child: const Icon(
                Icons.add_shopping_cart_outlined,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:greengrocer/src/models/item_model.dart';
import 'package:greengrocer/src/services/utils_services.dart';

import '../common_widgets/quantity_widget.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({
    Key? key,
    required this.item,
  }) : super(key: key);

  final ItemModel item;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  final UtilsServices utilsServices = UtilsServices();
  int cartItemQuantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(230),

      body: Stack(
        children: [

          //CONTEUDO
          Column(
            children: [
              Expanded(
                child: Hero(
                  tag: widget.item.imgUrl,
                    child: Image.asset(widget.item.imgUrl),
                ),
              ),

              //CONTAINER COM BORDAS ARREDONDADAS
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(50)
                    ),
                    boxShadow: [ //sombra
                      BoxShadow(
                        color: Colors.grey.shade600,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [

                      //NOME - QUANTIDADE
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.item.itemName,
                              maxLines: 2, //quantidade max de linhas para o nome do produto
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          QuantityWidget(
                            value: cartItemQuantity,
                            suffixText: widget.item.unit,

                            result: (int quantity){
                              setState(() {
                                cartItemQuantity = quantity;
                              });
                            },

                          ),
                        ],
                      ),

                      //PREÇO
                      Text(
                        utilsServices.priceToCurrency(widget.item.price),
                        style: const TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),

                      //DESCRIÇÃO
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SingleChildScrollView(
                            child: Text(
                                widget.item.description,
                              style: const TextStyle(
                                height: 1.5,
                              ),
                            ),
                          ),
                        ),
                      ),

                      //BOTÃO
                      SizedBox(
                        height: 55,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                            onPressed: (){},
                            label: const Text("Add no carrinho", style: TextStyle(
                              fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          icon: const Icon(Icons.shopping_cart_outlined,
                            color: Colors.white,),
                        ),
                      ),

                    ],
                  ),
                ),
              ),

            ],
          ),

          Positioned(
            //distancia das extremidades
            left: 10,
            top: 10,
            child: SafeArea(
              child: IconButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios),
              ),
            ),
          ),

        ],
      ),
    );
  }
}

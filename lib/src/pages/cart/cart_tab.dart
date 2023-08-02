import 'package:flutter/material.dart';
import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:greengrocer/src/pages/cart/components/cart_tile.dart';
import 'package:greengrocer/src/services/utils_services.dart';
import 'package:greengrocer/src/config/app_data.dart' as appData;

import '../common_widgets/payment_dialog.dart';

class CartTab extends StatefulWidget {
  const CartTab({Key? key}) : super(key: key);

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  //vamos usar esta classe para a formatação correta dos valores
  final UtilsServices utilsServices = UtilsServices();

  //metodo para remover item do carrinho
  void removeItemFromCart(CartItemModel cartItem){
    setState(() {
      appData.cartItems.remove(cartItem);
    });
  }

  //metodo para retornar o valor total de todos os produtos
  double cartTotalPRice(){
    double total = 0;
    for(var item in appData.cartItems){
      total += item.totalPrice();
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "Carrinho",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              //quantos items vamos ter na lista
              //esses items estão na clase app_data
              itemCount: appData.cartItems.length,
              itemBuilder: (_, index){
                return CartTile(
                  cartItem: appData.cartItems[index],
                  remove: removeItemFromCart,
                );
              },
            ),
          ),


          //CONTAINER BRANCO COM BORDAS ARREDONDADAS
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(30)),
              boxShadow: [
                //sombreamento
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 3,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //Text
                const Text(
                  "Total geral",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),

                //valor total
                Text(
                  utilsServices.priceToCurrency(cartTotalPRice()),
                  style: const TextStyle(
                    fontSize: 23,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                //botao para concluir o pedido
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    onPressed: () async {
                      //dialog de confirmaçao do pedido
                      bool? result = await showOrderConfirmation();
                      //a partir da confirmação do pedido
                      //eu apresento o dialog de pagamento se verdadeiro
                      if(result ?? false){
                        showDialog(
                          context: context,
                          builder: (_){
                            return PaymentDialog(
                              order: appData.orders.first,
                            );
                          },
                        );
                      }

                    },
                    child: const Text(
                      "Concluir pedido",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> showOrderConfirmation(){
    return showDialog<bool>(
      context: context,
      builder: (context){
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text("Confirmação"),
          content: const Text("Deseja realmente concluir o pedido?"),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.of(context).pop(false);
              },
              child: const Text("Não"),
            ),
            
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
                onPressed: (){
                  Navigator.of(context).pop(true);
                },
                child: const Text("Sim", style: TextStyle(color: Colors.white),),
            ),
          ],
        );
      },
    );
  }

}

import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/app_data.dart' as appData;
import 'package:greengrocer/src/pages/orders/components/order_tile.dart';

class OrdersTab extends StatelessWidget {
  const OrdersTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "Pedidos",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),

      //visualizaçao vertical com rolagem
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        //animação ao scrolar, puxar
        physics: const BouncingScrollPhysics(),

        separatorBuilder: (_, index){ //espaçamento - separador
          return const SizedBox(height: 10,);//separador entre um card e outro.
        },

        itemBuilder: (_, index){
          return OrderTile(
            order: appData.orders[index],
          );
        },

        //quantidade de itens que vamos apresentar na tela
        itemCount: appData.orders.length,
      ),
    );
  }
}

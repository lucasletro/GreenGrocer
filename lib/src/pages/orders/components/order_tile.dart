import 'package:flutter/material.dart';
import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:greengrocer/src/pages/common_widgets/payment_dialog.dart';
import 'package:greengrocer/src/pages/orders/components/order_status_widget.dart';
import 'package:greengrocer/src/services/utils_services.dart';

import '../../../models/order_model.dart';

class OrderTile extends StatelessWidget {
  final OrderModel order;

  OrderTile({
    Key? key,
    required this.order,
  }) : super(key: key);

  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card( //#1
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),

      child: Theme(//#3
        //cor transparente para q o divisor do ExpansionTile não apareça
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(//#2
          initiallyExpanded: order.status == 'pending_payment',

          title: Column( //NESTA COLUNA TEMOS O ID DO PEDIDO E DATA DE CRIAÇÃO
            mainAxisSize: MainAxisSize.min,
            //tamanho do eixo principal(vertical) crescer o minimo possivel
            crossAxisAlignment: CrossAxisAlignment.start,
            //alinhamento
            children: [
              Text(
                "Pedido: ${order.id}",
                style: const TextStyle(color: Colors.green),
              ),
              Text(
                utilsServices.formatDateTime(order.createdDateTime),
                style: const TextStyle(fontSize: 12, color: Colors.black),
              ),
            ],
          ),

          //aplica um espaçamento interno no children
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          //encaminhar/alinhar o texto do total para o inicio
          expandedCrossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            //quantidade-unidade-nome-valor e widget de status
            IntrinsicHeight(
              child: Row(
                children: [
                  //LISTA DE PRODUTOS
                  Expanded(
                    flex: 3, //proporção q este componente vai crescer
                    child: SizedBox(
                      height: 150,
                      child: ListView(
                        children: order.items.map((orderItem) {
                          return _OrderItemWidget(
                            utilsServices: utilsServices,
                            orderItem: orderItem,
                          );
                        }).toList(),
                      ),
                    ),
                  ),

                  //DIVISÃO VERTICAL
                  VerticalDivider(
                    color: Colors.grey.shade300,
                    thickness: 2,
                    width: 8,
                  ),

                  //STATUS DO PEDIDO
                  Expanded(
                    flex: 2,
                    child: OrderStatusWidget(
                      status: order.status,
                      //se a data de vencimento esta antes da data atual
                      isOverdue: order.overdueDateTime.isBefore(DateTime.now()),
                    ),
                  ),

                ],
              ),
            ),

            //TOTAL
            Text.rich(
              TextSpan(
                style: const TextStyle(
                  fontSize: 20
                ),
                children: [
                  const TextSpan(
                    text: "Total ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: utilsServices.priceToCurrency(order.total)),
                ],
              ),
            ),

            //BOTÃO PAGAMENTO
            Visibility( //condição para o botar ficar visivel
              //o botao só vai ser apresentado se o pagamento tiver pendente
              visible: order.status == 'pending_payment',
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                ),
                onPressed: (){
                  showDialog(
                    context: context,
                    builder: (_){
                      return PaymentDialog(
                        order: order,
                      );
                    },
                  );

                },
                icon: const Icon(Icons.pix,color: Colors.white),
                label: const Text("Ver QR Code Pix", style: TextStyle(color: Colors.white),),
              ),
            ),

          ],
        ),
      ),
    );
  }
}







class _OrderItemWidget extends StatelessWidget {
  const _OrderItemWidget({
    Key? key,
    required this.utilsServices,
    required this.orderItem,
  }) : super(key: key);

  final UtilsServices utilsServices;
  final CartItemModel orderItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            '${orderItem.quantity} ${orderItem.item.unit} ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(child: Text(orderItem.item.itemName)),
          Text(utilsServices.priceToCurrency(orderItem.totalPrice())),
        ],
      ),
    );
  }
}

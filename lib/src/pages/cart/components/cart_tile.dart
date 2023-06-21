import 'package:flutter/material.dart';
import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:greengrocer/src/pages/common_widgets/quantity_widget.dart';
import 'package:greengrocer/src/services/utils_services.dart';

//widget que vai apresentar as informações
//dos produto do carrinho.
//vai ser usada na classe cart_tab.

class CartTile extends StatefulWidget {
  final CartItemModel cartItem;
  final Function(CartItemModel) remove; //remover item do carrinho

  const CartTile({
    Key? key,
    required this.cartItem,
    required this.remove,
  }) : super(key: key);

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        //IMAGEM DO PRODUTO
        leading: Image.asset(
          widget.cartItem.item.imgUrl,
          height: 60,
          width: 60,
        ),

        //NOME DO PRODUTO
        title: Text(
          widget.cartItem.item.itemName,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),

        //PREÇO DO PRODUTO
        subtitle: Text(
          utilsServices.priceToCurrency(widget.cartItem.totalPrice()),
          style:
              const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),

        //WIDGET DE QUANTIDADE
        trailing: QuantityWidget(
          suffixText: widget.cartItem.item.unit,
          value: widget.cartItem.quantity,
          result: (quantity) {
            setState(() {
              //vai receber a quantidade(quantity) atualizada que vem do QuantityWidget.
              widget.cartItem.quantity = quantity;
              if(quantity == 0){
                //remover item do carrinho
                //este widget vai ser removido na cart_tab.
                widget.remove(widget.cartItem);
              }

            });
          },
          isRemovable: true,
        ),
      ),
    );
  }
}

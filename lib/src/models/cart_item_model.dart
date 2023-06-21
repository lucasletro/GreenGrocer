import 'package:greengrocer/src/models/item_model.dart';

//vamos criar uma instancia de CartItemModel
//na classe app_data.

class CartItemModel {
  ItemModel item;
  int quantity;

  CartItemModel({
    required this.item,
    required this.quantity,
  });

//vai retornar o preço total do produto
  double totalPrice() {
    return item.price * quantity;
  }
}

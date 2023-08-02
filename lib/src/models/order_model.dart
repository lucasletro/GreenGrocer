import 'package:greengrocer/src/models/cart_item_model.dart';
//instanciar esta classe na app_data
class OrderModel {
  String id;
  DateTime createdDateTime; //hora e data q o pedido foi criado.
  DateTime overdueDateTime; //quando o qrCode do pix venceu e nao conseguimos fazer pagamentos.
  List<CartItemModel> items; //lista de todos os produtos
  String status;
  String copyAndPast; //copia e cola do pix.
  double total;

  OrderModel({
    required this.id,
    required this.createdDateTime,
    required this.overdueDateTime,
    required this.items,
    required this.status,
    required this.copyAndPast,
    required this.total,
  });
}

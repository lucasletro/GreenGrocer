
//CLASSE DE MODELO DO ITEM DE APRESENTAÇÃO NA TELA HOME.
//vamos criar instancias de itemModel na app_data.

class ItemModel {
  String itemName;
  String imgUrl;
  String unit;
  double price;
  String description;

  ItemModel({
    required this.description,
    required this.imgUrl,
    required this.itemName,
    required this.price,
    required this.unit,
  });
}

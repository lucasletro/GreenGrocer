//AQUI VAMOS ADICIONAR TODOS OS DADOS QUE VAMOS
//USAR NO APP.

import 'package:greengrocer/src/models/item_model.dart';
import 'package:greengrocer/src/models/user_model.dart';

import '../models/cart_item_model.dart';
import '../models/order_model.dart';

ItemModel apple = ItemModel(
  description:
      'A melhor maçã da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
  imgUrl: 'assets/fruits/apple.png',
  itemName: 'Maçã',
  price: 5.5,
  unit: 'kg',
);

ItemModel grape = ItemModel(
  imgUrl: 'assets/fruits/grape.png',
  itemName: 'Uva',
  price: 7.4,
  unit: 'kg',
  description:
      'A melhor uva da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel guava = ItemModel(
  imgUrl: 'assets/fruits/guava.png',
  itemName: 'Goiaba',
  price: 11.5,
  unit: 'kg',
  description:
      'A melhor goiaba da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel kiwi = ItemModel(
  imgUrl: 'assets/fruits/kiwi.png',
  itemName: 'Kiwi',
  price: 2.5,
  unit: 'un',
  description:
      'O melhor kiwi da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel mango = ItemModel(
  imgUrl: 'assets/fruits/mango.png',
  itemName: 'Manga',
  price: 2.5,
  unit: 'un',
  description:
      'A melhor manga da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel papaya = ItemModel(
  imgUrl: 'assets/fruits/papaya.png',
  itemName: 'Mamão papaya',
  price: 8,
  unit: 'kg',
  description:
      'O melhor mamão da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

//lista de items que vamos utilizar
List<ItemModel> items = [
  apple,
  grape,
  guava,
  kiwi,
  mango,
  papaya,
];

//lista de categorias
List<String> categories = [
  "Frutas",
  "Grãos",
  "Verduras",
  "Temperos",
  "Cereais",
];

//lista de produtos do carrinho
//vamos usar esta lista para
//apresentar os produtos na tela do carrinho.
List<CartItemModel> cartItems = [
  CartItemModel(
    item: apple,
    quantity: 1,
  ),
  CartItemModel(
    item: mango,
    quantity: 1,
  ),
  CartItemModel(
    item: guava,
    quantity: 3,
  ),
];

//usuario - perfil
UserModel user = UserModel(
  phone: "99 9 9999-9999",
  cpf: "999.999.999-99",
  email: "lucas@gmail.com",
  name: "Lucas",
  password: "senha",
);

//lista de pedidos que vai ser apresentada na orders_tile
List<OrderModel> orders = [
  //PEDIDO 01
  OrderModel(
    id: 'asd6a54da6s2d1',
    createdDateTime: DateTime.parse("2024-07-07 10:00:10.458"),
    overdueDateTime: DateTime.parse("2024-07-07 11:00:10.458"),
    status: "pending_payment",
    copyAndPast: 'q1w2e3r4t5y6',
    total: 11,
    items: [
      //pedidos
      CartItemModel(
        item: apple,
        quantity: 2,
      ),
      CartItemModel(
        item: mango,
        quantity: 2,
      ),
    ],
  ),

  //PEDIDO 02
  OrderModel(
    copyAndPast: 'q1w2e3r4t5y6',
    createdDateTime: DateTime.parse('2024-06-08 10:00:10.458'),
    overdueDateTime: DateTime.parse('2024-06-08 11:00:10.458'),
    id: 'a65s4d6a2s1d6a5s',
    status: 'delivered',
    total: 11.5,
    items: [
      CartItemModel(
        item: guava,
        quantity: 1,
      ),
    ],
  ),
];

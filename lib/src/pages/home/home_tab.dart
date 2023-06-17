import 'package:flutter/material.dart';
import 'package:greengrocer/src/pages/home/components/item_tile.dart';
import '../../config/app_data.dart' as appData;
import 'components/category_tile.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

  String selectedCategory = "Frutas";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //APP BAR
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text.rich(
          TextSpan(
              style: TextStyle(
                fontSize: 30,
              ),
              children: [
                TextSpan(
                    text: "Green",
                    style: TextStyle(
                      color: Colors.green,
                    )),
                TextSpan(
                    text: "Grocer",
                    style: TextStyle(
                      color: Colors.red,
                    )),
              ]),
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 20),
            child: GestureDetector(
              onTap: () {},
              child: const Badge(
                backgroundColor: Colors.red,
                label: Text(
                  "2",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Icon(
                    Icons.shopping_cart,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      body: Column(
        children: [
          //CAMPO DE PESQUISA
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                //reduzir a altura
                isDense: true,
                hintText: "Pesquise aqui",
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 14,
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.red,
                  size: 21,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(60),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none, //bordas inesistentes
                  ),
                ),
              ),
            ),
          ),

          //CATEGORIAS
          Container(
            padding: const EdgeInsets.only(left: 25),
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index){
                return CategoryTile(
                  onPressed: (){
                    setState(() {
                      selectedCategory = appData.categories[index];
                    });
                  },
                  category: appData.categories[index],
                  isSelected: appData.categories[index] == selectedCategory,
                );
              },
              //separação entre um item e outro na lista
              separatorBuilder: (_, index) => const SizedBox(width: 10),
              itemCount: appData.categories.length,
            ),
          ),

          //GRID
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  //questoes de espaçamento entre um item e outro
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 9/11.5,
                ),
                //quantidade de itens que vamos apresentar an tela
                itemCount: appData.items.length,
                itemBuilder: (_, index) {
                  return ItemTile(
                    item: appData.items[index],
                  );
                },
            ),
          ),

        ],
      ),
    );
  }
}

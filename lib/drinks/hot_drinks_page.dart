import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/drinks/item_hot_drinks.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';

import 'item_hot_drinks_details.dart';

// ignore: must_be_immutable
class HotDrinksPage extends StatelessWidget {
  final List<ProductHotDrinks> drinksList;
  List<ProductItemCart> productosAgregados = [];
  HotDrinksPage({
    Key key,
    @required this.drinksList,
    @required this.productosAgregados,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bebidas"),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop(productosAgregados);
          },
          child: Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            Container(
              child: ListView.builder(
                itemCount: drinksList.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () async {
                      productosAgregados = await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ItemHotDrinkDetails(
                            drink: drinksList[index],
                            productosAgregados: productosAgregados,
                          ),
                        ),
                      );

                      //Navigator.of(context).pop(productosAgregados);
                    },
                    child: ItemHotDrinks(
                      drink: drinksList[index],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

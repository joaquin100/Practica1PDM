import 'package:estructura_practica_1/desserts/item_desesert.dart';
import 'package:estructura_practica_1/desserts/item_dessert_details.dart';
import 'package:estructura_practica_1/models/product_dessert.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DessertsPage extends StatelessWidget {
  final List<ProductDessert> dessertsList;
  List<ProductItemCart> productosAgregados = [];
  DessertsPage({
    Key key,
    @required this.dessertsList,
    @required this.productosAgregados,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Postres"),
        centerTitle: true,
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
                itemCount: dessertsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () async {
                      productosAgregados = await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ItemDessertDetails(
                            dessert: dessertsList[index],
                            productosAgregados: productosAgregados,
                          ),
                        ),
                      );
                      //Navigator.of(context).pop(productosAgregados);
                    },
                    child: ItemDessert(
                      dessert: dessertsList[index],
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

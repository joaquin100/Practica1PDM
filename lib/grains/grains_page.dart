import 'package:estructura_practica_1/grains/item_grains.dart';
import 'package:estructura_practica_1/grains/item_grains_details.dart';
import 'package:estructura_practica_1/models/product_grains.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GrainsPage extends StatelessWidget {
  final List<ProductGrains> grainsList;
  List<ProductItemCart> productosAgregados = [];
  GrainsPage({
    Key key,
    @required this.grainsList,
    @required this.productosAgregados,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Café de grano"),
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
                itemCount: grainsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () async {
                      productosAgregados = await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ItemGrainsDetails(
                            grains: grainsList[index],
                            productosAgregados: productosAgregados,
                          ),
                        ),
                      );
                      Navigator.of(context).pop(productosAgregados);
                    },
                    child: ItemGrains(
                      grains: grainsList[index],
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

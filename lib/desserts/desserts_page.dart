import 'package:estructura_practica_1/desserts/item_desesert.dart';
import 'package:estructura_practica_1/desserts/item_dessert_details.dart';
import 'package:estructura_practica_1/models/product_dessert.dart';
import 'package:flutter/material.dart';

class DessertsPage extends StatelessWidget {
  final List<ProductDessert> dessertsList;

  const DessertsPage({
    Key key,
    @required this.dessertsList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Postres"),
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
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              ItemDessertDetails(dessert: dessertsList[index]),
                        ),
                      );
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

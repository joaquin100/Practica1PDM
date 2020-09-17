import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';

import '../utils/constants.dart';

class ItemHotDrinks extends StatefulWidget {
  final ProductHotDrinks drink;
  ItemHotDrinks({
    Key key,
    @required this.drink,
  }) : super(key: key);

  @override
  _ItemHotDrinksState createState() => _ItemHotDrinksState();
}

class _ItemHotDrinksState extends State<ItemHotDrinks> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
            height: MediaQuery.of(context).size.height / 4,
            child: Stack(
              children: [
                Container(
                  color: cuppingGrayBCB0A1,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(Icons.favorite),
                    color: widget.drink.liked ? Colors.black : Colors.white,
                    onPressed: () {
                      widget.drink.liked = !widget.drink.liked;
                      setState(() {});
                    },
                  ),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 10,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 0,
                      bottom: 0,
                      left: 90,
                      right: 40,
                    ),
                    child: Image.network(
                      widget.drink.productImage,
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Text(
                    "Café",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                Positioned(
                  top: 45,
                  left: 10,
                  child: Container(
                    width: 80,
                    child: Text("${widget.drink.productTitle}",
                        style: TextStyle(
                          color: cuppingWhiteFFFFFF,
                          fontSize: 15,
                        )),
                  ),
                ),
                Positioned(
                  top: 100,
                  left: 10,
                  child: Text(
                    "\$${widget.drink.productPrice}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

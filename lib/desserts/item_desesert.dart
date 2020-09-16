import 'package:estructura_practica_1/models/product_dessert.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';

class ItemDessert extends StatefulWidget {
  final ProductDessert dessert;
  ItemDessert({Key key, @required this.dessert}) : super(key: key);

  @override
  _ItemDessertState createState() => _ItemDessertState();
}

class _ItemDessertState extends State<ItemDessert> {
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
                    color: widget.dessert.liked ? Colors.black : Colors.white,
                    onPressed: () {
                      widget.dessert.liked = !widget.dessert.liked;
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
                      left: 70,
                      right: 50,
                    ),
                    child: Image.network(
                      widget.dessert.productImage,
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
                Positioned(
                  child: Text("Cafe"),
                ),
                Positioned(
                  top: 20,
                  child: Container(
                    width: 30,
                    child: Text("${widget.dessert.productTitle}"),
                  ),
                ),
                Positioned(
                  top: 40,
                  child: Text("${widget.dessert.productPrice}"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

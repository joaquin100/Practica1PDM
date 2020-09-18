import 'package:estructura_practica_1/models/product_grains.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';

class ItemGrains extends StatefulWidget {
  final ProductGrains grains;
  ItemGrains({Key key, @required this.grains}) : super(key: key);

  @override
  _ItemGrainsState createState() => _ItemGrainsState();
}

class _ItemGrainsState extends State<ItemGrains> {
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
                    color: widget.grains.liked ? Colors.black : Colors.white,
                    onPressed: () {
                      widget.grains.liked = !widget.grains.liked;
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
                      top: 10,
                      bottom: 10,
                      left: 90,
                      right: 40,
                    ),
                    child: Image.network(
                      widget.grains.productImage,
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Text(
                    "Café de grano",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                Positioned(
                  top: 45,
                  left: 10,
                  child: Container(
                    width: 90,
                    child: Text(
                      "${widget.grains.productTitle}",
                      style: TextStyle(
                        color: cuppingWhiteFFFFFF,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 100,
                  left: 10,
                  child: Text(
                    "\$${widget.grains.productPrice}",
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

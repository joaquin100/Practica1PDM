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
                      top: 0,
                      bottom: 0,
                      left: 70,
                      right: 50,
                    ),
                    child: Image.network(
                      widget.grains.productImage,
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
                Positioned(
                  child: Text("Café de grano"),
                ),
                Positioned(
                  top: 20,
                  child: Container(
                    width: 30,
                    child: Text("${widget.grains.productTitle}"),
                  ),
                ),
                Positioned(
                  top: 40,
                  child: Text("${widget.grains.productPrice}"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

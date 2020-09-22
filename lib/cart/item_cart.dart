import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ItemCart extends StatefulWidget {
  final ProductItemCart product;
  final ValueChanged<double> onAmountUpdated;
  final ValueChanged<int> onRemove;
  final int index;

  //final Function(ItemCart p) remove;
  //List<ProductItemCart> productsList;
  ItemCart({
    Key key,
    @required this.onAmountUpdated,
    @required this.product,
    @required this.index,
    //this.remove,
    @required this.onRemove,
  }) : super(key: key);

  @override
  _ItemCartState createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> {
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
                  color: cuppingOrangeEC9762,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(Icons.favorite),
                    color: widget.product.liked ? Colors.black : Colors.white,
                    onPressed: () {},
                  ),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 40,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 30,
                      left: 5,
                      right: 160,
                    ),
                    child: Image.network(
                      widget.product.productImage,
                      height: 100,
                      width: 80,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: IconButton(
                    icon: Icon(Icons.add_circle_outline),
                    onPressed: _addProd,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 40,
                  child: IconButton(
                    icon: Icon(Icons.remove_circle),
                    onPressed: _remProd,
                  ),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 70,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${widget.product.productTitle}",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15)),
                  ),
                ),
                Positioned(
                  top: 100,
                  bottom: 0,
                  left: 70,
                  right: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${widget.product.productAmount}",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
                Positioned(
                  top: 100,
                  bottom: 0,
                  left: 150,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "\$${widget.product.productPrice}",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  bottom: 0,
                  left: 70,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${widget.product.feature}",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Positioned(
                  right: 5,
                  bottom: 0,
                  child: IconButton(
                    icon: Icon(
                      Icons.restore_from_trash,
                    ),
                    color: Colors.black,
                    onPressed: () {
                      widget.onRemove(widget.index);
                      print("Removing");
                      _remProd();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _addProd() {
    setState(() {
      ++widget.product.productAmount;
    });
    widget.onAmountUpdated(widget.product.productPrice);
  }

  void _remProd() {
    setState(() {
      if (widget.product.productAmount <= 0) {
        widget.product.productAmount = 0;
      } else {
        --widget.product.productAmount;
        widget.onAmountUpdated(-1 * widget.product.productPrice);
      }
    });
  }
}

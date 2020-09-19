import 'package:estructura_practica_1/payment.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/cart/item_cart.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';

// ignore: must_be_immutable
class Cart extends StatefulWidget {
  List<ProductItemCart> productsList = [];
  Cart({
    Key key,
    @required this.productsList,
  }) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  double _total = 0;
  @override
  void initState() {
    super.initState();
    for (var item in widget.productsList) {
      _total += (item.productPrice * item.productAmount);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Lista de Compras"),
        leading: GestureDetector(
          onTap: () {
            /*for (int i = 0; i < widget.productsList.length; i++) {
              if (widget.productsList.elementAt(i).productTitle == null) {
                widget.productsList.removeAt(i);
              }
            }
            Navigator.of(context).pop(widget.productsList);*/
          },
          child: Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 10,
              ),
              height: MediaQuery.of(context).size.height * 0.6,
              child: ListView.builder(
                itemCount: widget.productsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ItemCart(
                    onAmountUpdated: _priceUpdate,
                    product: widget.productsList[index],
                  );
                },
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 0,
                    left: 20,
                  ),
                  child: Text(
                    "Total: \n$_total MX\$",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 18,
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Payment()),
                        );
                      },
                      child: Text(
                        "PAGAR",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      color: cuppingGray8B8175,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: cuppingGray8B8175,
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _priceUpdate(double newItemPrice) {
    setState(() {
      _total += newItemPrice;
    });
  }
}

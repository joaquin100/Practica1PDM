import 'package:estructura_practica_1/models/product_dessert.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:estructura_practica_1/models/product_repository.dart';
import 'package:estructura_practica_1/payment.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ItemDessertDetails extends StatefulWidget {
  final ProductDessert dessert;
  List<ProductItemCart> productosAgregados = [];
  ItemDessertDetails({
    Key key,
    @required this.dessert,
    @required this.productosAgregados,
  }) : super(key: key);

  @override
  _ItemDessertDetailsState createState() => _ItemDessertDetailsState();
}

class _ItemDessertDetailsState extends State<ItemDessertDetails> {
  // ignore: non_constant_identifier_names
  Color _border_and_text_color_button_chico = Colors.grey;
  // ignore: non_constant_identifier_names
  Color _border_and_text_color_button_mediano = Colors.purple;
  // ignore: non_constant_identifier_names
  Color _border_and_text_color_button_grande = Colors.grey;

  // ignore: non_constant_identifier_names
  Color _font_color_button_chico = Colors.white;
  // ignore: non_constant_identifier_names
  Color _font_color_button_mediano = Colors.purple[100];
  // ignore: non_constant_identifier_names
  Color _font_color_button_grande = Colors.white;

  bool exists = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "${widget.dessert.productTitle}",
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop(widget.productosAgregados);
          },
          child: Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 31, horizontal: 20),
              height: MediaQuery.of(context).size.height / 3,
              child: Stack(
                children: [
                  Container(
                    color: cuppingOrangeEC9762,
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
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Image.network(
                        widget.dessert.productImage,
                        height: 100,
                        width: 100,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text("${widget.dessert.productTitle}"),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                "${widget.dessert.productDescription}",
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Text("TAMAÑOS DISPONIBLES"),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "\$${widget.dessert.productPrice}",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MaterialButton(
                          onPressed: () {
                            _border_and_text_color_button_chico = Colors.purple;
                            _border_and_text_color_button_mediano = Colors.grey;
                            _border_and_text_color_button_grande = Colors.grey;

                            _font_color_button_chico = Colors.purple[100];
                            _font_color_button_mediano = Colors.white;
                            _font_color_button_grande = Colors.white;

                            widget.dessert.productSize = ProductSize.CH;
                            widget.dessert.productPrice =
                                widget.dessert.productPriceCalculator();

                            setState(() {});
                          },
                          child: Text(
                            "Chico",
                            style: TextStyle(
                              color: _border_and_text_color_button_chico,
                            ),
                          ),
                          color: _font_color_button_chico,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: _border_and_text_color_button_chico,
                                width: 1,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        MaterialButton(
                          onPressed: () {
                            _border_and_text_color_button_chico = Colors.grey;
                            _border_and_text_color_button_mediano =
                                Colors.purple;
                            _border_and_text_color_button_grande = Colors.grey;

                            _font_color_button_chico = Colors.white;
                            _font_color_button_mediano = Colors.purple[100];
                            _font_color_button_grande = Colors.white;

                            widget.dessert.productSize = ProductSize.M;
                            widget.dessert.productPrice =
                                widget.dessert.productPriceCalculator();

                            setState(() {});
                          },
                          child: Text(
                            "Mediano",
                            style: TextStyle(
                              color: _border_and_text_color_button_mediano,
                            ),
                          ),
                          color: _font_color_button_mediano,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: _border_and_text_color_button_mediano,
                              width: 1,
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        MaterialButton(
                          onPressed: () {
                            _border_and_text_color_button_chico = Colors.grey;
                            _border_and_text_color_button_mediano = Colors.grey;

                            _border_and_text_color_button_grande =
                                Colors.purple;

                            _font_color_button_chico = Colors.white;
                            _font_color_button_mediano = Colors.white;
                            _font_color_button_grande = Colors.purple[100];

                            widget.dessert.productSize = ProductSize.G;
                            widget.dessert.productPrice =
                                widget.dessert.productPriceCalculator();

                            setState(() {});
                          },
                          child: Text(
                            "Grande",
                            style: TextStyle(
                              color: _border_and_text_color_button_grande,
                            ),
                          ),
                          color: _font_color_button_grande,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: _border_and_text_color_button_grande,
                                width: 1,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      for (int i = 0;
                          i < widget.productosAgregados.length;
                          i++) {
                        if (widget.productosAgregados[i].productTitle
                            .contains(widget.dessert.productTitle)) {
                          exists = true;
                        }
                      }

                      if (exists) {
                        print(widget.productosAgregados);
                        Navigator.of(context).pop(widget.productosAgregados);
                      } else {
                        widget.dessert.productAmount = 1;
                        widget.dessert.feature =
                            widget.dessert.productFeature();
                        // ignore: non_constant_identifier_names
                        ProductItemCart product_to_cart = new ProductItemCart(
                          feature: widget.dessert.feature,
                          typeOfProduct: ProductType.POSTRES,
                          productTitle: widget.dessert.productTitle,
                          productAmount: widget.dessert.productAmount,
                          productPrice: widget.dessert.productPrice,
                          productImage: widget.dessert.productImage,
                          liked: widget.dessert.liked,
                          productSize: widget.dessert.productSize,
                          productWeight: null,
                        );
                        widget.productosAgregados.add(product_to_cart);
                        print(widget.productosAgregados);
                        Navigator.of(context).pop(widget.productosAgregados);
                      }
                    },
                    child: Text(
                      "AGREGAR AL CARRITO",
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
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
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      //Payment
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Payment()),
                      );
                    },
                    child: Text(
                      "COMPRAR AHORA",
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
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
                SizedBox(
                  width: 10,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

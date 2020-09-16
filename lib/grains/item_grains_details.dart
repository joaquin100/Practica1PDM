import 'package:estructura_practica_1/models/product_grains.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:estructura_practica_1/models/product_repository.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ItemGrainsDetails extends StatefulWidget {
  final ProductGrains grains;
  List<ProductItemCart> productosAgregados = [];
  ItemGrainsDetails({
    Key key,
    @required this.grains,
    @required this.productosAgregados,
  }) : super(key: key);

  @override
  _ItemGrainsDetailsState createState() => _ItemGrainsDetailsState();
}

class _ItemGrainsDetailsState extends State<ItemGrainsDetails> {
  // ignore: non_constant_identifier_names
  Color _border_and_text_color_button_250g = Colors.grey;
  // ignore: non_constant_identifier_names
  Color _border_and_text_color_button_1k = Colors.purple;

  // ignore: non_constant_identifier_names
  Color _font_color_button_250g = Colors.white;
  // ignore: non_constant_identifier_names
  Color _font_color_button_1k = Colors.purple[100];

  bool exists = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.grains.productTitle}",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
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
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(34.0),
                      child: Image.network(
                        widget.grains.productImage,
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
              child: Text("${widget.grains.productTitle}"),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text("${widget.grains.productDescription}"),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
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
                      Text("\$${widget.grains.productPrice}"),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 40,
                        ),
                        MaterialButton(
                          onPressed: () {
                            _border_and_text_color_button_250g = Colors.purple;
                            _border_and_text_color_button_1k = Colors.grey;

                            _font_color_button_250g = Colors.purple[100];
                            _font_color_button_1k = Colors.white;

                            widget.grains.productWeight = ProductWeight.CUARTO;
                            widget.grains.productPrice =
                                widget.grains.productPriceCalculator();

                            setState(() {});
                          },
                          child: Text(
                            "250G",
                            style: TextStyle(
                              color: _border_and_text_color_button_250g,
                            ),
                          ),
                          color: _font_color_button_250g,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: _border_and_text_color_button_250g,
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
                            _border_and_text_color_button_250g = Colors.grey;
                            _border_and_text_color_button_1k = Colors.purple;

                            _font_color_button_250g = Colors.white;
                            _font_color_button_1k = Colors.purple[100];

                            widget.grains.productWeight = ProductWeight.KILO;
                            widget.grains.productPrice =
                                widget.grains.productPriceCalculator();

                            setState(() {});
                          },
                          child: Text(
                            "1K",
                            style: TextStyle(
                              color: _border_and_text_color_button_1k,
                            ),
                          ),
                          color: _font_color_button_1k,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: _border_and_text_color_button_1k,
                              width: 1,
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        SizedBox(
                          width: 8,
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
                            .contains(widget.grains.productTitle)) {
                          exists = true;
                        }
                      }

                      if (exists) {
                        print(widget.productosAgregados);
                        Navigator.of(context).pop(widget.productosAgregados);
                      } else {
                        // ignore: non_constant_identifier_names
                        ProductItemCart product_to_cart = new ProductItemCart(
                          typeOfProduct: ProductType.GRANO,
                          productTitle: widget.grains.productTitle,
                          productAmount: widget.grains.productAmount,
                          productPrice: widget.grains.productPrice,
                          productImage: widget.grains.productImage,
                          liked: widget.grains.liked,
                          productSize: null,
                          productWeight: widget.grains.productWeight,
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
                    onPressed: () {},
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

import 'package:estructura_practica_1/models/product_dessert.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';

class ItemDessertDetails extends StatefulWidget {
  final ProductDessert dessert;
  ItemDessertDetails({Key key, @required this.dessert}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.dessert.productTitle}",
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
                      padding: const EdgeInsets.all(34.0),
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
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text("${widget.dessert.productDescription}"),
            ),
            SizedBox(
              height: 20,
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
                      Text("\$${widget.dessert.productPrice}"),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
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
                    onPressed: () {},
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

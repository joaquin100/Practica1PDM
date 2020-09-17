import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  Payment({Key key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagos"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                left: 60,
                top: 30,
                right: 70,
                bottom: 0,
              ),
              child: Text(
                "Elige tú método de pago:",
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
                top: 0,
                right: 30,
                bottom: 0,
              ),
              child: GestureDetector(
                onTap: _dialog,
                child: Card(
                  elevation: 4.0,
                  margin: EdgeInsets.all(10.0),
                  color: cuppingGray8B8175,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Image.network(
                          "https://previews.123rf.com/images/magurok/magurok1408/magurok140800176/30819935-vector-tarjeta-de-cr%C3%A9dito-icon-negro.jpg",
                          width: 100,
                          height: 100,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 30,
                            top: 0,
                            right: 10,
                            bottom: 30,
                          ),
                          child: Text(
                            "Tarjeta de crédito",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 0,
                          top: 100,
                          right: 10,
                          bottom: 10,
                        ),
                        child: Icon(Icons.edit),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
                top: 0,
                right: 30,
                bottom: 0,
              ),
              child: GestureDetector(
                onTap: _dialog,
                child: Card(
                  elevation: 4.0,
                  margin: EdgeInsets.all(10.0),
                  color: cuppingGray8B8175,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Image.network(
                          "https://e7.pngegg.com/pngimages/989/772/png-clipart-logo-paypal-graphics-product-computer-icons-paypal-blue-angle.png",
                          width: 100,
                          height: 100,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 30,
                            top: 0,
                            right: 10,
                            bottom: 30,
                          ),
                          child: Text(
                            "PayPal",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 0,
                          top: 100,
                          right: 10,
                          bottom: 10,
                        ),
                        child: Icon(Icons.edit),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 35,
                top: 0,
                right: 35,
                bottom: 0,
              ),
              child: GestureDetector(
                onTap: _dialog,
                child: Card(
                  elevation: 4.0,
                  color: cuppingGray8B8175,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Image.network(
                          "https://previews.123rf.com/images/a1bracadabr1a/a1bracadabr1a1612/a1bracadabr1a161200024/71463488-icono-de-tarjeta-de-regalo-ilustraci%C3%B3n-vectorial-aislado-plana-s%C3%ADmbolo.jpg",
                          width: 100,
                          height: 100,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 30,
                            top: 0,
                            right: 20,
                            bottom: 20,
                          ),
                          child: Text(
                            "Tarjeta de regalo",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 0,
                          top: 100,
                          right: 10,
                          bottom: 10,
                        ),
                        child: Icon(Icons.edit),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _dialog() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: <Widget>[
            Image.network(
                "https://www.rustikcoffee.com/wp-content/uploads/2019/05/Formas-de-preparar-cafe-en-granos.jpg"),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    left: 0,
                    top: 10,
                    right: 0,
                    bottom: 0,
                  ),
                  child: Icon(
                    Icons.local_cafe,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    top: 0,
                    right: 0,
                    bottom: 0,
                  ),
                  child: Text(
                    "¡Orden exitosa!",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    top: 0,
                    right: 140,
                    bottom: 10,
                  ),
                  child: Text("Taza Cupping"),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    top: 15,
                    right: 0,
                    bottom: 0,
                  ),
                  child: Text(
                      "Tu orden ha sido registrada, para más información busca en la opción de compras en tú perfil"),
                ),
              ],
            ),
            MaterialButton(
              child: Text("ACEPTAR"),
              onPressed: () {},
            ),
          ],
        );
      },
    );
  }
}

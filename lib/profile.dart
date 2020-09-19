import 'package:flutter/material.dart';
import 'package:estructura_practica_1/utils/constants.dart';

import 'cart/cart.dart';
import 'models/product_item_cart.dart';

// ignore: must_be_immutable
class Profile extends StatelessWidget {
  List<ProductItemCart> productosAgregados = [];
  Profile({
    Key key,
    @required this.productosAgregados,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(PROFILE_TITLE),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: 150,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    PROFILE_PICTURE,
                  ),
                  minRadius: 40,
                  maxRadius: 80,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                PROFILE_NAME,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: Colors.black),
              ),
              SizedBox(
                height: 8,
              ),
              Text(PROFILE_EMAIL),
              SizedBox(
                height: 16,
              ),
              ListTile(
                title: Text(PROFILE_CART),
                leading: Icon(Icons.shopping_cart),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => Cart(productsList: productosAgregados),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text(PROFILE_WISHES),
                leading: Icon(Icons.thumb_up),
                onTap: () {},
              ),
              ListTile(
                title: Text(PROFILE_HISTORY),
                leading: Icon(Icons.store),
                onTap: () {},
              ),
              ListTile(
                title: Text(PROFILE_SETTINGS),
                leading: Icon(Icons.settings),
                onTap: () {},
              ),
              ListTile(
                title: Text("LOG OUT"),
                leading: Icon(Icons.close),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:estructura_practica_1/cart/cart.dart';
import 'package:estructura_practica_1/desserts/desserts_page.dart';
import 'package:estructura_practica_1/grains/grains_page.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/home/item_home.dart';
import 'package:estructura_practica_1/profile.dart';
import '../drinks/hot_drinks_page.dart';
import '../models/product_repository.dart';

class Home extends StatefulWidget {
  final String title;
  Home({Key key, this.title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ProductItemCart> productosAgregados = [];

  @override
  Widget build(BuildContext context) {
    var _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: cuppingOrangeEC9762),
              accountName: Text(PROFILE_NAME),
              accountEmail: Text(PROFILE_EMAIL),
              currentAccountPicture: CircleAvatar(
                backgroundColor: cuppingGray8B8175,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    PROFILE_PICTURE,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            ListTile(
              title: Text(PROFILE_CART),
              leading: Icon(Icons.shopping_cart),
              onTap: () async {
                productosAgregados = await Navigator.of(context).push(
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
        ), // Populate the Drawer in the next step.
      ),
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () async {
              productosAgregados = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => Cart(productsList: productosAgregados),
                ),
              );
            },
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: _openHotDrinksPage,
            child: ItemHome(
              title: "Bebidas calientes",
              image: "https://i.imgur.com/XJ0y9qs.png",
            ),
          ),
          GestureDetector(
            onTap: _openGrainsPage,
            child: ItemHome(
              title: "Granos",
              image: "https://i.imgur.com/5MZocC1.png",
            ),
          ),
          GestureDetector(
            onTap: _openDessertPage,
            child: ItemHome(
              title: "Postres",
              image: "https://i.imgur.com/fI7Tezv.png",
            ),
          ),
          GestureDetector(
            onTap: () {
              _scaffoldKey.currentState
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text("PRÓXIMAMENTE"),
                  ),
                );
            },
            child: ItemHome(
              title: "Tazas",
              image: "https://i.imgur.com/fMjtSpy.png",
            ),
          ),
        ],
      ),
    );
  }

  void _openHotDrinksPage() async {
    productosAgregados = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return HotDrinksPage(
            drinksList: ProductRepository.loadProducts(
              ProductType.BEBIDAS,
            ),
            productosAgregados: productosAgregados,
          );
        },
      ),
    );
  }

  void _openGrainsPage() async {
    productosAgregados = await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) {
        return GrainsPage(
          grainsList: ProductRepository.loadProducts(
            ProductType.GRANO,
          ),
          productosAgregados: productosAgregados,
        );
      }),
    );
  }

  void _openDessertPage() async {
    productosAgregados = await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) {
        return DessertsPage(
          dessertsList: ProductRepository.loadProducts(
            ProductType.POSTRES,
          ),
          productosAgregados: productosAgregados,
        );
      }),
    );
  }
}

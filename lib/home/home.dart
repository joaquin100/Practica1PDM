import 'package:estructura_practica_1/cart/cart.dart';
import 'package:estructura_practica_1/desserts/desserts_page.dart';
import 'package:estructura_practica_1/grains/grains_page.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
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
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.of(context).push(
                // TODO: Eliminar este boton y adaptar todo el contenido de la pagina de perfil en un Drawer aqui en la pantalla Home
                MaterialPageRoute(builder: (_) => Profile()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).push(
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

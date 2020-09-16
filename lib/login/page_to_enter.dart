import 'package:estructura_practica_1/login/register.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class PageToEnter extends StatefulWidget {
  PageToEnter({Key key}) : super(key: key);

  @override
  _PageToEnterState createState() => _PageToEnterState();
}

class _PageToEnterState extends State<PageToEnter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: cuppingBlue214254,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 90),
            child: Image(
              image: AssetImage('assets/cupping.png'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Register(),
                        ),
                      );
                    },
                    child: Text(
                      "REGISTRATE",
                      style: TextStyle(color: cuppingBlack121B22),
                    ),
                    color: cuppingGray8B8175,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: MaterialButton(
                    onPressed: () {},
                    child: Text(
                      "INGRESA",
                      style: TextStyle(color: cuppingBlack121B22),
                    ),
                    color: cuppingGray8B8175,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

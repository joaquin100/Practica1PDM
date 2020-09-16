import 'package:flutter/material.dart';

import '../home/home.dart';
import '../utils/constants.dart';

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _unfocusedColor = Colors.grey[600];
  final _usernameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _usernameFocusNode.addListener(() {
      setState(() {
        //Redraw so that the username label reflects the focus state
      });
    });

    _passwordFocusNode.addListener(() {
      setState(() {
        //Redraw so that the password label reflects the focus state
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        color: cuppingBlue214254,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 90),
                child: Image(
                  image: AssetImage('assets/cupping.png'),
                ),
              ),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Username',
                  labelStyle: TextStyle(
                      color: _usernameFocusNode.hasFocus
                          ? cuppingBlack121B22
                          : _unfocusedColor),
                ),
                focusNode: _usernameFocusNode,
              ),
              SizedBox(height: 12.0),
              Text("Password"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true, //This will obscure text dynamically
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    labelStyle: TextStyle(
                        color: _usernameFocusNode.hasFocus
                            ? cuppingBlack121B22
                            : _unfocusedColor),
                    // Here is key idea
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.visibility_off,
                        color: cuppingGrayBCB0A1,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12.0),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: MaterialButton(
                        onPressed: () {
                          /*Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Home(title: APP_TITLE),
                            ),
                          );*/
                          Navigator.of(context)
                              .popUntil((route) => route.isFirst);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Home(
                                    title:
                                        APP_TITLE) //builder: (context) => Home(title: APP_TITLE)
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
            ],
          ),
        ),
      ),
    );
  }
}

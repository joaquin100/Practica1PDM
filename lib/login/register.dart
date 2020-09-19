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
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();

  bool check = false;

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
              SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: Image(
                  height: 100,
                  image: AssetImage('assets/cupping.png'),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0),
                    child: Text(
                      "Nombre completo:",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  style: TextStyle(
                    color: cuppingBlue214254,
                  ),
                  controller: _usernameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  focusNode: _usernameFocusNode,
                ),
              ),
              SizedBox(height: 5.0),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0),
                    child: Text(
                      "Email:",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  style: TextStyle(
                    color: cuppingBlue214254,
                  ),
                  controller: _emailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  focusNode: _emailFocusNode,
                ),
              ),
              SizedBox(height: 3.0),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0),
                    child: Text(
                      "Password:",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  controller: _passwordController,
                  obscureText: true, //This will obscure text dynamically
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 0.0),
                    ),
                    filled: true,
                    fillColor: cuppingBlue214254,
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
              SizedBox(height: 3.0),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Checkbox(
                      value: check,
                      activeColor: Colors.grey,
                      onChanged: (bool x) {
                        setState(() {
                          check = x;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      "ACEPTO LOS TÉRMINOS Y CONDICIONES DE USO",
                      style: TextStyle(
                        color: cuppingGrayBCB0A1,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 3,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
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
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  "¿Ya tienes una cuenta?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: cuppingGrayBCB0A1,
                    fontSize: 12,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  "INGRESA",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: cuppingGrayBCB0A1,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

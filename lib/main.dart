import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: (Center(
            child: Text('Login Page'),
          )),
          backgroundColor: Color.fromARGB(255, 22, 166, 232),
        ),
        body: LoginPage(),
      ),
    ),
  );
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  final RegExp e = RegExp(
      r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$'); //regular exp for email
  final RegExp p = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'); //regular exp for password

  bool emailValid(String email) {
    return e.hasMatch(email);
  }

  bool passwordValid(String password) {
    return p.hasMatch(password);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                        width: 2,
                        color: emailValid(email) ? Colors.green : Colors.red),
                    //borderRadius: BorderRadius.circular(25.0),
                  ),
                  labelText: 'Enter your Email address',
                ),
                onChanged: (value) {
                  email =
                      value; //here inside onChanged we are assigning value, remember this, you completely forgot to do this, which took your 2hrs to figure out
                  setState(() {
                    // here setState is very important to change the state of the box. Remember we're using a STATEFUL widget, you took more 3hrs to figure ou why setState() is showing error
                    if (emailValid(email)) {
                      Colors.green;
                    } else {
                      Colors.red;
                    }
                  });
                },
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.black),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  labelText: 'Enter your Password',
                ),
                onChanged: (value) {
                  password = value;
                  setState(() {});
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 45,
              width: 90,
              child: ElevatedButton(
                  onPressed:
                      !(emailValid(email) && passwordValid(password)) == true
                          ? null
                          : () {},
                  child: Text('Login')),
            )
          ]),
    );
  }
}

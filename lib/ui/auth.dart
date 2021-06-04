import 'package:crypto_bag/net/flutterfire.dart';
import 'package:flutter/material.dart';

import 'home_view.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.pink,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 1.4,
              child: TextFormField(
              controller: _email,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  hintText: 'something@email.com',
                  hintStyle: TextStyle(
                    color: Colors.blue,
                  ),
                  contentPadding: EdgeInsets.all(20),
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.white)),
            ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 35,),
            Container(
              width: MediaQuery.of(context).size.width / 1.4,
            child: TextFormField(
                controller: _password,
                obscureText: true,
                cursorColor: Colors.cyan,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    hintText: 'password',
                    hintStyle: TextStyle(
                      color: Colors.blue,
                    ),
                    contentPadding: EdgeInsets.all(20),
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.white)))),
                    SizedBox(height: MediaQuery.of(context).size.height / 35,),
            Container(
              width: MediaQuery.of(context).size.width / 1.4,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white),
              child: MaterialButton(
                onPressed: () async {
                  bool shouldNavigate =
                      await register(_email.text, _password.text);
                  if (shouldNavigate) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeView(),),);
                  }
                },
                child: Text('Register'),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 35,),
            Container(
              width: MediaQuery.of(context).size.width / 1.4,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white),
              child: MaterialButton(
                onPressed: () async {
                  bool shouldNavigate =
                      await signIn(_email.text, _password.text);
                  if (shouldNavigate) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeView(),),);
                  }
                },
                child: Text('Log In'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

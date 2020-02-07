import 'package:flutter/material.dart';
import 'package:ng_client/src/ui/Home.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState(); 
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  String _userName;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        padding: EdgeInsets.all(16.0),

        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 16.0,),
              Text(
                'Login Information',
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(height: 16.0,),
              TextFormField(

                onSaved: (value) => _userName = value,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: "User Name"),
              ),
              SizedBox(height: 16.0,),
              TextFormField(
                onSaved: (value) => _password = value,
                obscureText: true,
                decoration: InputDecoration(labelText: "Password"),
              ),
              SizedBox(height: 16.0,),
              RaisedButton(
                child: Text('LOGIN'), onPressed: onPressed,
              )
            ],
          ),
        )
      ),
    );
  }

  void onPressed() {
    final form = _formKey.currentState;
    form.save();

    // validate
    if (form.validate()) {
      print('$_userName $_password');
    }
    //Navigator.of(context).push(Home());
  }
}
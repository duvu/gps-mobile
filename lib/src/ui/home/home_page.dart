import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ng_client/src/resources/authentication/authentication.dart';
import 'package:ng_client/src/resources/authentication/authentication_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        leading: GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.menu
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.search,
              size: 26.0,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.more_vert
              ),
            ),
          )
        ],
      ),
      body: Container(
        child: Center(
            child: RaisedButton(
          child: Text('logout'),
          onPressed: () {
            BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
          },
        )),
      ),
    );
  }
}

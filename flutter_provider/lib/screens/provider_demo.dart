import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class User {
  User(this.name);
  final String name;
}

var currentUser = User('siven');
class ProviderDemo extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('provider'),
      ),
      body: Provider.value(
        value: currentUser,
        child: Container(
          child: Center(
            child: Consumer<User>(
              builder: (context,user,child)=>
              Text('my name is ${user.name}'),
            )
          ),
        ),
      ),
    );
  }
}
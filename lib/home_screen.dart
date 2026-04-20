import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,backgroundColor: Colors.green,title: Text("Home",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),
      body: Center(child: Container(child: Text("Home Screen"),)),


    );
  }
}

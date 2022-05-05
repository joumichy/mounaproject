
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happytree/util/util.dart';

import '../create/create.dart';

class Menu extends StatefulWidget {

  final routeName = '/menu';

  const Menu({Key? key}) : super(key: key);

  @override
  MenuState createState() => MenuState();
}

class MenuState extends State<Menu> {


  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordhide = true;
  @override
  void initState() {
    super.initState();
  }

  Widget content() {
    return FutureBuilder(builder: (context, snapshot) {
      if(snapshot.hasData){
        return Text("Data");
      }
      else{
        return Column(children: [
          Image.asset("asset/images/logo.png", width: 200,height: 200,),
          Text("Ajouter votre Mini Tree", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,),),
          Padding(padding: EdgeInsets.only(top: 20), child:    Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(40.0), color: Colors.grey),

            child: TextButton(


              onPressed: () {
                navigateWithName(context, Create().routeName);

              }, child: Text("+",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 30)), )
            ,),)

        ],);
      }

    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Center(
            child: content()
        )
    );
  }
}

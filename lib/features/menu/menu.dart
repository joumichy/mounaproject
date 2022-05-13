
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happytree/features/connection_setting/connection_setting.dart';
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
          Padding(padding: EdgeInsets.only(top: 40), child:  Image.asset("asset/images/logo.png", width: 200,height: 200,),),
          Text("Ajouter votre plante", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,),),
          Padding(padding: EdgeInsets.only(top: 20), child:    Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(40.0), color: Colors.grey),

            child: TextButton(


              onPressed: () {
                navigateWithName(context, Create().routeName);

              }, child: Text("+",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 30)), )
            ,),),

          Padding(padding: EdgeInsets.only(top: 60, bottom: 20), child:  Text("Parametre de connexion", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,),),),
          Padding(padding: EdgeInsets.only(top: 20), child:

          InkWell(
          onTap: () {
              navigateWithName(context, ConnectionSetting().routeName);
            },
            child: Image.asset("asset/icons/tool.png", width: 100, height: 100,))
            ,),

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

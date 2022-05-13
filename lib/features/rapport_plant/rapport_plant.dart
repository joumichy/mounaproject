
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happytree/features/connection_setting/connection_setting.dart';
import 'package:happytree/features/menu/menu.dart';
import 'package:happytree/util/util.dart';

import '../../components/design/design.dart';
import '../create/create.dart';

class RapportPlant extends StatefulWidget {

  final routeName = '/rapportplant';
  final String plantName;
  final String plantLocation;
  final String secondPlantName;

  const RapportPlant({Key? key, this.plantName = "",this.plantLocation = "",this.secondPlantName = ""}) : super(key: key);
  const RapportPlant.withName({Key? key, required this.plantName,  required this.plantLocation, required this.secondPlantName}) : super(key: key);

  @override
  RapportPlantState createState() => RapportPlantState();
}

class RapportPlantState extends State<RapportPlant> {


  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController textEditingController = TextEditingController();
  String dropdownValue = "Chambre";
  @override
  void initState() {
    super.initState();
  }

  Widget content() {
    return Column(children: [
      Padding(padding: EdgeInsets.only(top: 0, bottom: 40),

          child: Image.asset("asset/images/plante.png",width: 600,height: 200,fit: BoxFit.cover,)),

      Padding(padding: EdgeInsets.only(top: 40, bottom: 0), child:           Text(widget.plantName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,),)),


      ElevatedButton(

          style: BaseButtonRoundedColorBorder(200, 50, Colors.pink, 25.0),
          onPressed: ()  {

            navigateWithNamePop(context, Menu().routeName);

          }, child: Text("Plante Morte", style: TextStyle(fontSize: 20),)),


    ],);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset : false,
        appBar: AppBar(),

        body: Center(
            child: content()
        )
    );
  }
}


import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happytree/features/connection_setting/connection_setting.dart';
import 'package:happytree/features/menu/menu.dart';
import 'package:happytree/util/util.dart';

import '../../components/design/design.dart';
import '../create/create.dart';

class SettingPlant extends StatefulWidget {

  final routeName = '/settingplant';
  final plantName;
  const SettingPlant({Key? key, this.plantName = ""}) : super(key: key);
  const SettingPlant.withName({Key? key, required this.plantName}) : super(key: key);

  @override
  SettingPlantState createState() => SettingPlantState();
}

class SettingPlantState extends State<SettingPlant> {


  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController textEditingController = TextEditingController();
  String dropdownValue = "Chambre";
  @override
  void initState() {
    super.initState();
  }

  Widget content() {
        return ListView(
          children: [

          Padding(
              padding: EdgeInsets.only(top: 40, bottom: 0),
              child: Text(widget.plantName, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,),)),
          Padding(padding: EdgeInsets.only(top: 20),
            child: InkWell(
              onTap: () {
                // navigateWithName(context, Create().routeName);

              },
              child: Image.asset("asset/icons/add-photo.png", width: 150, height: 150, color: Colors.grey,), )
            ,),

          Padding(padding: EdgeInsets.only(top: 5, bottom: 20), child:  Text("Ajouter une photo", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),),),
          Align(
            child: Row(children: [
              Image.asset("asset/icons/form.png", width: 60, height: 60,),
              Text("Formulaire", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),)]),
            alignment: Alignment.bottomLeft,),
          Align(
            alignment: Alignment.bottomLeft,
            child:           Padding(padding: EdgeInsets.only(top: 20), child: Text("Prénom de la plante :", style: TextStyle(fontSize: 15),),),
          ),

          TextField(
            controller: textEditingController,
            decoration: InputDecoration(
                enabledBorder: setUnderlineBorderColor(3.0, 1.0, Colors.white),
              focusedBorder: setUnderlineBorderColor(3.0, 1.0, Colors.white)
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child:           Padding(padding: EdgeInsets.only(top: 30), child: Text("Emplacement :", style: TextStyle(fontSize: 15),),),
          ),
         Padding(padding: EdgeInsets.only(top: 30, bottom: 40), child: Container(
           width: 250,
           alignment: Alignment.center,
           decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(width: 3, color: Colors.white)),
           child:  DropdownButton<String>(

               value: dropdownValue,

               style: TextStyle(color: Colors.white),
               items: <String>['Chambre', 'Salon', 'Balcon', 'Terasse']
                   .map<DropdownMenuItem<String>>((String value) {
                 return DropdownMenuItem<String>(

                   value: value,
                   child: Text(value,style: TextStyle(color: Colors.white),),
                 );
               }).toList(),
               onChanged: (String? value){
                 dropdownValue = value!;
                 setState(() {

                 });
               }),),),
          ElevatedButton(

            style: BaseButtonRoundedColorBorder(200, 50, APPCOLOR4, 25.0),
              onPressed: ()  {
              final title = textEditingController.text;
              log(title);

              saveNewTree(title, widget.plantName,dropdownValue);
              navigateWithNamePop(context, Menu().routeName);

          }, child: Text("Enregistrer", style: TextStyle(fontSize: 20),)),


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

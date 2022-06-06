
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happytree/features/connection_setting/connection_setting.dart';
import 'package:happytree/features/menu/menu.dart';
import 'package:happytree/util/util.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import '../../components/design/custom_slider.dart';
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
  double tempValue = 15.0;
  @override
  void initState() {
    super.initState();
  }

  Widget cardElem(child, String title){

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
          children: [
      Padding(padding: EdgeInsets.only(top : 10,left: 10,bottom: 10), child:  Align(child: Text(title, style: TextStyle(color: APPCOLOR, fontSize: 25),textAlign: TextAlign.start), alignment: Alignment.centerLeft),),
            child,
            Padding(padding: EdgeInsets.only(bottom: 10), child:         Text("Toucher pour savoir"),)
    ]),);

  }

  

  Widget content() {
    return ListView(
      children: [
      Padding(padding: EdgeInsets.only(top: 0, bottom: 40),

          child: Image.asset("asset/images/plante.png",width: 600,height: 200,fit: BoxFit.cover,)),

      Padding(padding: EdgeInsets.only(top: 0, bottom: 0), child:           Text(widget.plantName, textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,),)),

      Padding(padding: EdgeInsets.only(top: 40, bottom: 0), child:     cardElem(
          ListTile(leading: Container(child: Icon(Icons.wb_sunny)), title: Text("Mi-soleil, mi ombre"), subtitle: Text("Luminosité idéale"),),
           "Luminosité")),

      Padding(padding: EdgeInsets.only(top: 40, bottom: 0), child:     cardElem(

           SfSliderTheme(
             data:  SfSliderThemeData(
               thumbColor: Colors.red,
               activeDividerColor: Colors.white,
               activeDividerStrokeColor: Colors.red,
               activeDividerStrokeWidth: 1,
               activeDividerRadius: 6,
               activeTrackColor: Colors.red,

               disabledActiveDividerColor: Colors.white,
               inactiveDividerColor: Colors.red,
               inactiveDividerStrokeWidth: 1,
               inactiveDividerRadius: 6,
             ),
             child:  SfSlider(
                 showTicks: true,
                 showLabels: true,
                 enableTooltip: true,
                 showDividers: true,
                 // dividerShape:  DividerShapeCustom(),
                 inactiveColor: Colors.red.shade50,
                 // activeColor: Colors.red,
                 value: tempValue,onChanged: (value){
               tempValue = value; setState(() {

               });}, interval: 5, min : 0, max : 30),
           ),

          "Température idéale")),


      Padding(padding: EdgeInsets.only(top: 40, bottom: 0), child:     cardElem(
          ListTile(leading: Container(child: Image.asset("asset/icons/degree.png",width: 40, height: 40,)), title: Text("5°C"), subtitle: Text("Température de survie la plus faible en pot"),),
          "Zone de rusticité")),

      Padding(padding: EdgeInsets.only(top: 40, bottom: 10),
          child:     cardElem(
          Padding(padding: EdgeInsets.only(left: 10,right: 10),
            child:   Column(

            children:  [
              // Padding(padding: EdgeInsets.only(top: 10, bottom: 10), child: Align(child: Text("Intérieur"),alignment: Alignment.centerLeft,),),

              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Text("Jan"),Text("Jui"),Text("Dec"),],),
              ElevatedButton(

                  style: BaseButtonRoundedColorBorder(600, 30, APPCOLOR3, 25.0),
                  onPressed: ()  {

                  }, child: Text("Année compl.", style: TextStyle(color: Colors.black),)),
              Padding(padding: EdgeInsets.only(top: 10, bottom: 10), child: Align(child: Text("Extérieur"),alignment: Alignment.centerLeft,),),
              SfSliderTheme(
                data:  SfSliderThemeData(
                  activeDividerColor: Colors.red,
                  activeDividerStrokeColor: Colors.red,
                  activeDividerStrokeWidth: 1,
                  activeDividerRadius: 6,
                  activeTrackColor: Colors.transparent,

                  disabledActiveDividerColor: Colors.red,
                  inactiveDividerColor: Colors.red,
                  inactiveDividerStrokeColor: Colors.red,
                  inactiveDividerStrokeWidth: 1,
                  inactiveDividerRadius: 6,
                  inactiveTrackColor: Colors.transparent,
                  thumbColor: Colors.transparent,
                  thumbRadius: 50,
                  overlayRadius: 0,


                ),
                child : SfSlider(
                    // enableTooltip: true,
                    showDividers: true,


                    // thumbShape: SfThumbShapeCustom(),
                    thumbIcon: Align(child : Container( width: 200, decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: APPCOLOR3),child : Text("mai - sep",style :TextStyle(color:  Colors.black),textAlign: TextAlign.center,))),
                    // dividerShape:  DividerShapeCustom(),
                    // activeColor: Colors.red,
                    value: 15,
                    onChanged: (value){
                  }, interval: 5, min : 0, max : 30),
              ),



            ],
          ),),
          "Lieux adaptés")),
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

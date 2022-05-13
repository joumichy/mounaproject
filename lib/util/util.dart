import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:happytree/models/PlantType.dart';
import 'package:shared_preferences/shared_preferences.dart';

navigateTo(context,view){
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => view),
  );
}
navigateWithName(context, String name){
  Navigator.pushNamed(context, name);
}

navigateWithNamePop(context, String name){
  Navigator.popAndPushNamed(context, name);
}

showSnackBar(context, message){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(duration: const Duration(milliseconds: 1500),content: Text(message)),
  );
}
Future<void> saveNewTree(String plantname, String secondplantname, String plantlocation) async {

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setString("secondplantname", secondplantname);
  sharedPreferences.setString("plantlocation", plantlocation);
  sharedPreferences.setString("plantname", plantname);



}

Future<dynamic> getPlantData()async{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  Object? secondplantname = sharedPreferences.get("secondplantname");
  Object? plantlocation = sharedPreferences.get("plantlocation");
  Object? plantname = sharedPreferences.get("plantname");

  return {
    "plantname" : plantname.toString(),
    "secondplantname" : secondplantname.toString(),
    "plantlocation" : plantlocation.toString(),

  };
}

final plantfleuries = PlantType(id: "id", type: "Plantes fleuries", path: "asset/images/plante_fleuries.png");
final plantorchidees = PlantType(id: "id", type: "Orchidées", path: "asset/images/orchidees.png");
final plantcactus = PlantType(id: "id", type: "Cactus et succulentes", path: "asset/images/cactus.png");
final plantlegumes = PlantType(id: "id", type: "Légumes",  path: "asset/images/legume.png");
final plantherbes = PlantType(id: "id", type: "Herbes", path: "asset/images/herbes.png");
final plantfeuillage = PlantType(id: "id", type: "Plantes à feuillage",path: "asset/images/plante_feuillage.png");

final List<PlantType >mocTypesOfPlantes = [plantfleuries,plantorchidees,plantcactus,plantlegumes,plantherbes,plantfeuillage];
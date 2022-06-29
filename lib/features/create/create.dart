
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happytree/features/create/api.dart';
import 'package:happytree/features/menu/menu.dart';
import 'package:happytree/features/plantitem/plantitem.dart';
import 'package:happytree/models/PlantType.dart';
import 'package:happytree/response/plantsresponse.dart';

import '../../../components/design/design.dart';
import '../../../util/util.dart';
import '../setting_plant/setting_plant.dart';

class Create extends StatefulWidget {

  final routeName = '/create';

  const Create({Key? key}) : super(key: key);

  @override
  CreateState createState() => CreateState();
}

class CreateState extends State<Create> {



  TextEditingController textEditingController = TextEditingController();

  List<PlantType> plantList = mocTypesOfPlantes;
  bool isSearching = false;
  @override
  void initState() {

    super.initState();

  }




  Widget contentSearch(){
    return Visibility(
      visible: isSearching ,
      child: Column(children: const [
      Padding(padding: EdgeInsets.all(12), child:   Text("Chercher une plante", style: TextStyle(fontSize: 25),),),
      Text("Chercher un nom, variété ou un nom spécifique", style: TextStyle(fontSize: 16),)
    ],), );
  }

  Widget itemPlant(String nameFlower, String plantId){
    return InkWell(
      onTap: (){
        navigateTo(context, SettingPlant.withName(plantName: nameFlower, plantId: plantId,));
      },
      child: Row(children: [
        Image.asset("asset/icons/file-eye.png",width: 40, height: 40,),
        Container(
          width: 300,
          height: 50,
          padding: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border.all(width: 1, color: Colors.white)),
          child: Text(nameFlower, style: TextStyle(fontSize: 20), textAlign: TextAlign.center,),
        )
      ],),);
  }
  Widget content() {
    return Visibility(
      visible: !isSearching,
      child:  Expanded(child:
      FutureBuilder(
        future: getPlantTypes(),
        builder: (context, AsyncSnapshot<PlantsResponse>snapshot) {

          if(snapshot.connectionState == ConnectionState.done){
            return  ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: snapshot.data!.plants!.length,
              itemBuilder: (context, index) {
                return itemPlant(snapshot.data!.plants![index].name_flower ?? "test", snapshot.data!.plants![index].id ?? "id");
              },);
          }
          else{
            return Text("No Data");
          }
      },)
      ));
  }

  itemTypeOfPlant(PlantType plantType){
    return InkWell(onTap: () {
      //TODO sendData
      navigateTo(context, PlantItem(plantId: plantType.id,));
      
    },child: Column(children: [
      ClipRRect(


        borderRadius: BorderRadius.circular(10.0),
        child: Image(

            image: AssetImage(plantType.path),width: 100,height: 100,fit: BoxFit.fill),),
      Padding(padding: EdgeInsets.only(top: 5), child: Text(plantType.type,textAlign: TextAlign.center),)
    ],),);
  }
  Widget header(){
    return
        Column(children: [

          Visibility(
            visible: !isSearching,
            child:const Padding(
              padding: EdgeInsets.only(top: 20 ),
              child: Text("Chercher une plante", style: TextStyle(fontSize: 30, ),),),
          ),
          Padding(padding: EdgeInsets.only(top: 40,bottom: 40),
            child:  FocusScope(child: TextField(

              // focusNode: _focus,

              controller: textEditingController,

              onChanged: (value){

              },


              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.lightGreen[30],
                  focusedBorder: setOutlineBorderSearch(0.0, 25.0) ,
                  enabledBorder: setOutlineBorderSearch(0.0, 25.0) ,
                  hintText: "Rechercher",
                  prefixIcon: Icon(Icons.search, color: APPCOLOR3,),
                  suffixIcon: IconButton(icon: Icon(Icons.close), onPressed: (){
                    textEditingController.clear();
                    FocusScopeNode currentFocus = FocusScope.of(context);

                    if (!currentFocus.hasPrimaryFocus) {
                      isSearching = false;
                      currentFocus.unfocus();
                    }
                    // FocusManager.instance.primaryFocus?.unfocus();


                  },)
              ),),onFocusChange: (focus){

              log("CLICK $focus");
              setState(() {
                isSearching = focus;
              });

            },))

        ],);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset : false,
        appBar: AppBar(),
        body: Column(
            children: [header(),content(), contentSearch()],
        )
    );
  }
}

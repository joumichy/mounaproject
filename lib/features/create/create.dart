
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happytree/features/menu/menu.dart';
import 'package:happytree/features/plantitem/plantitem.dart';
import 'package:happytree/models/PlantType.dart';

import '../../../components/design/design.dart';
import '../../../util/util.dart';

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
  Widget content() {
    return Visibility(
      visible: !isSearching,
      child: Padding(padding: EdgeInsets.only(top: 40),child: Container(
      child: GridView.builder(
          shrinkWrap: true, // You won't see infinite size error
          itemCount: 6,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
          ), itemBuilder: (context, index){
        return itemTypeOfPlant(plantList[index]);
      }
      ),)),);
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
              padding: EdgeInsets.only(top: 20),
              child: Text("Chercher une plante", style: TextStyle(fontSize: 30, ),),),
          ),
          Padding(padding: EdgeInsets.only(top: 40),
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

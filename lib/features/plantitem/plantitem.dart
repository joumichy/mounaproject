
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happytree/features/menu/menu.dart';
import 'package:happytree/models/PlantType.dart';

import '../../../components/design/design.dart';
import '../../../util/util.dart';

class PlantItem extends StatefulWidget {

  final routeName = '/plantitem';
  final String plantId;

  const PlantItem({Key? key, this.plantId = ""}) : super(key: key);
  const PlantItem.withId({Key? key, required this.plantId}) : super(key: key);

  @override
  PlantItemState createState() => PlantItemState();
}

class PlantItemState extends State<PlantItem> {



  TextEditingController textEditingController = TextEditingController();

  List<PlantType> plantList = mocTypesOfPlantes;
  bool isSearching = false;
  @override
  void initState() {

    super.initState();

  }






  Widget content() {
    //TODO afficher la vue
    return Text("DATA");
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset : false,
        appBar: AppBar(),
        body: content(),
    );
  }
}

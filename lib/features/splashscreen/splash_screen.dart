
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:happytree/features/menu/menu.dart';

import '../../util/config.dart';
import '../../util/util.dart';
import '../auth/signin/signin.dart';

class SplashScreen extends StatefulWidget {

  final routeName = '/splashscreen';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {

  bool isUserLogged = false;

  @override
  void initState() {
    fetchData();
    super.initState();

  }

  fetchData() async {
    String data = await getCurrentUserToken();
    if (data.length > 5 ){
      isUserLogged = true;
      log(data);
      log("ACCESS GRANTED");
    }
    navigateToApp(isUserLogged);

  }

  navigateToApp(bool isLogged) async {
    String path = isLogged  ? const Menu().routeName : const SignIn().routeName ;
    // String path = const SignIn().routeName ;

    Future.delayed(Duration.zero, () async {
      await Navigator.pushNamed(context, path);
    });

  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  Center(child: Text('SplashScreen'))

    );
  }
}

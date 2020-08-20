import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:iotappagriculture/setting.dart';
import 'package:iotappagriculture/theme.dart';
import 'model/user_login_model.dart';
import 'DashboardPage.dart';
import 'screen/register_page.dart';
import 'screen/login_screen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: buildThemeData(),
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) =>  SignupPage(),
        DeviceSelectionPage.routeName : (_) => DeviceSelectionPage()
      },
      home:  LoginPage(),
    );
  }
}

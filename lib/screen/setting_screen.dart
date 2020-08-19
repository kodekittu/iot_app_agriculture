import 'package:flutter/material.dart';
import 'package:iotappagriculture/setting.dart';
import 'package:iotappagriculture/widget/CustomListTileWidget.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  void _nextScreen () {
    Navigator.of(context).pushNamed(DeviceSelectionPage.routeName);
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Center(child: Text('Setting', textScaleFactor: 1.5, style: TextStyle(fontWeight: FontWeight.w700),),),
        CustomListTileWidget('Device', Icons.chevron_right, _nextScreen),
        CustomListTileWidget('Users', Icons.chevron_right, _nextScreen),

      ],
      //child: showModalBottomSheet(context: context, builder: (context) => Scaffold()),
    );
  }
}

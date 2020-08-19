import 'package:flutter/material.dart';

class CustomListTileWidget extends StatelessWidget {
  final String _tileName;
  final IconData _icon;
  final Function onTapFunction;

  CustomListTileWidget(this._tileName, this._icon, this.onTapFunction);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(_tileName),
      trailing: IconButton(
        icon: Icon(_icon),
        onPressed: onTapFunction,
      ),
    );
  }
}

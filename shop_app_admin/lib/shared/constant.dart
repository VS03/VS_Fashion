import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app_admin/screens/home/dataSearch.dart';
import '../constants.dart';

const textInputStyle = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0)
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueGrey, width: 2.0)
  ),
);

AppBar buildAppBar(BuildContext context){
  return AppBar(
    backgroundColor: Colors.indigo[300] ,
    elevation: 0,
    actions: <Widget>[
      IconButton(
        icon: SvgPicture.asset(
          "assets/icons/search.svg",
          color: Colors.white,
        ),
        onPressed: () {
          DataSearch().getname();
          showSearch(context: context, delegate: DataSearch());
        },
      ),
    ],
  );
}

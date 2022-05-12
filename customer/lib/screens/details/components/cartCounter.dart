import 'package:flutter/material.dart';

import '../../../constants.dart';

// ignore: camel_case_types
class cartCounter extends StatefulWidget {
  const cartCounter({Key key}) : super(key: key);

  @override
  _cartCounterState createState() => _cartCounterState();
}

// ignore: camel_case_types
class _cartCounterState extends State<cartCounter> {
  int numOfItems = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        buildOutLineButton(
          icon: Icons.remove,
          press: () {
            setState(() {
              if(numOfItems > 1){
                numOfItems--;
              }
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: Text(
            numOfItems.toString().padLeft(2, "0"),
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        buildOutLineButton(
          icon: Icons.add,
          press: () {
            setState(() {
                numOfItems++;
            });
          },
        ),
      ],
    );
  }

  SizedBox buildOutLineButton({IconData icon, Function press} ) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlineButton(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        onPressed: press,
        child: Icon(icon),
      ),
    );
  }
}

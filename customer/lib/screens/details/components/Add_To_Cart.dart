import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app_admin/models/Product.dart';
import 'package:shop_app_admin/screens/details/components/formScreen.dart';

import '../../../constants.dart';


// ignore: camel_case_types
class Add_To_Cart extends StatelessWidget {
  const Add_To_Cart({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: kDefaultPaddin),
            height: 50,
            width: 58,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: Color(product.color))
            ),
            child: IconButton(
              icon: SvgPicture.asset(
                "assets/icons/add_to_cart.svg",
                color: Color(product.color),),
                onPressed: (){},
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 30,
              child: FlatButton(
                color: Color(product.color),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FormScreen(product: product,)
                    )
                  );
                },
                child: Text(
                  "Change Details",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

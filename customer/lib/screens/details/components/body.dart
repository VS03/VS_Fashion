import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_admin/constants.dart';
import 'package:shop_app_admin/models/Product.dart';

import 'Add_To_Cart.dart';
import 'Counter_FavButton.dart';
import 'Product_title_with_image.dart';
import 'color_size.dart';
import 'description.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.35),
                  padding: EdgeInsets.only(
                    top: size.height *0.12,
                    left: kDefaultPaddin,
                    right: kDefaultPaddin,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20,),
                      color_size(product: product),
                      SizedBox(height: 20,),
                      Description(product: product),
                      SizedBox(height: 20,),
                      Counter_FavButton(),
                      Add_To_Cart(product: product)
                    ],
                  ),
                ),
                ProductTitleWithImage(product: product)
              ],
            ),
          )
        ],
      ),
    );
  }
}

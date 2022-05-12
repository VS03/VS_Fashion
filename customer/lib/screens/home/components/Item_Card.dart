import 'package:flutter/material.dart';
import 'package:shop_app_admin/models/Product.dart';
import 'package:shop_app_admin/service/database.dart';

import '../../../constants.dart';

class Itemcard extends StatelessWidget {
  final Product product;
  final Function press;
  const Itemcard({
    Key key,
    this.product,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(kDefaultPaddin),
              decoration: BoxDecoration(
                color: Color(product.color ?? 0xFFFF3232),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: "${product.id}",
                child: Image.network(product.image),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin/4),
                    child: Text(
                      product.title,
                      style: TextStyle(color: kTextLightColor),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin/4),
                    child: Text(
                      "\$${product.price}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: kTextColor
                      ),
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () async {
                  await DatabaseService(uid: product.id).deleteProductData();
                }, 
                icon: Icon(
                  Icons.delete_forever,
                ),
              ),
            ],
          ), 
        ],
      ),
    );
  }
}


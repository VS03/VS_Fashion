import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app_admin/constants.dart';
import 'package:shop_app_admin/models/Product.dart';
import 'components/body.dart';
class DetailsScreen extends StatelessWidget {
   final Product product;

   const DetailsScreen({this.product});

   @override
   Widget build(BuildContext context) {

     return Scaffold(
       backgroundColor: Color(product.color),
       appBar: buildAppBar(context),
       body: Body(product: product),
     );
   }

   AppBar buildAppBar(BuildContext context) {
     return AppBar(
       elevation: 0,
       backgroundColor: Color(product.color),
       leading: IconButton(icon: SvgPicture.asset('assets/icons/back.svg'), color: Colors.white,
         onPressed: () => Navigator.pop(context),
       ),
       actions: <Widget>[
         IconButton(
             icon: SvgPicture.asset('assets/icons/search.svg'),
             onPressed: () {}
         ),
         SizedBox(width: kDefaultPaddin/2,)
       ],
     );
   }
 }
 
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_admin/models/Product.dart';
import 'package:shop_app_admin/screens/details/details_screen.dart';
import 'package:shop_app_admin/constants.dart';
import 'Item_Card.dart';

class Man_Woman_Body extends StatefulWidget {

  final Function changeCollection;

  Man_Woman_Body({this.changeCollection});
  
  @override
  _Man_Woman_BodyState createState() => _Man_Woman_BodyState();

  getshowMan() {
    return _Man_Woman_BodyState.showMan;
  }

  getshowShirts() {
    return _Man_Woman_BodyState.showShirts;
  }
  
}

class _Man_Woman_BodyState extends State<Man_Woman_Body> {

  Future _loadDataFirebase(List<Product> list) async {
    list.removeRange(0, list.length);
    final product  = Provider.of<List<Product>>(context) ?? [];
    product.forEach((item) {
      list.add( 
        Product(
          id: item.id,
          title: item.title,
          size: item.size,
          image: item.image,
          description: item.description,
          price: item.price,
          color: item.color
        )
      );
    });
    return true;
  }

  static bool showShirts = true;
  static bool showMan = true;

  @override
  Widget build(BuildContext context) {

    if(showMan){
      if(showShirts){
        if(upper.length == 0){
          _loadDataFirebase(upper);
        }
      }
      else{
        if(lower.length == 0){
          _loadDataFirebase(lower);
        }
      }
    }
    else{
      if(showShirts){
        if(saree.length == 0){
          _loadDataFirebase(saree);
        }
      }
      else{
        if(dress.length == 0){
          _loadDataFirebase(dress);
        }
      }
    }

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: [
                FlatButton(
                  onPressed: () async {
                    showShirts ? await widget.changeCollection('upper') : await widget.changeCollection('lower');
                    await Future.delayed(Duration(seconds: 1));
                    if(!showMan){
                      setState(() {
                        showMan = true;
                      });
                    }
                  }, 
                  child: Text(
                    "Man",
                    style: Theme.of(context).textTheme.headline5.copyWith(
                      fontWeight: FontWeight.bold, 
                      color: showMan ? kTextColor : kTextLightColor,
                    ),
                  )
                ),
                Container(
                  margin: EdgeInsets.only(top: kDefaultPaddin/4),
                  height: 2,
                  width: 30,
                  color: showMan ? Colors.blue : Colors.transparent,
                )
              ],
            ),
            Column(
              children: [
                FlatButton(
                  onPressed: () async {
                    showShirts ? await widget.changeCollection('saree') : await widget.changeCollection('dress');
                    await Future.delayed(Duration(seconds: 1));
                    if(showMan){
                      setState(() {
                        showMan = false;
                      });
                    }
                  }, 
                  child: Text(
                    "Woman",
                    style: Theme.of(context).textTheme.headline5.copyWith(
                      fontWeight: FontWeight.bold,
                      color: !showMan ? kTextColor : kTextLightColor,
                    ),
                  )
                ),
                Container(
                  margin: EdgeInsets.only(top: kDefaultPaddin/4),
                  height: 2,
                  width: 30,
                  color: !showMan ? Colors.blue : Colors.transparent,
                )
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: <Widget>[
                FlatButton(
                  onPressed: () async {
                    if(showMan){
                      if(upper.length == 0){
                        await widget.changeCollection('upper');
                        await Future.delayed(Duration(seconds: 1));
                        await _loadDataFirebase(upper);
                      }
                    }
                    else{
                      if(saree.length == 0){
                        await widget.changeCollection('saree');
                        await Future.delayed(Duration(seconds: 1));
                        await _loadDataFirebase(saree);
                      }
                    }
                    setState(() {
                        showShirts = true;
                    });
                  }, 
                  child: Text(
                    showMan ? "Shirts" : "Saree",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:showShirts ? kTextColor : kTextLightColor,
                    ),
                  )
                ),
                Container(
                  margin: EdgeInsets.only(top: kDefaultPaddin/4),
                  height: 2,
                  width: 30,
                  color: showShirts ? Colors.blue : Colors.transparent,
                ),
              ],
            ),
            Column(
              children: [
                FlatButton(
                  onPressed: () async {
                    if(showMan){
                      if(lower.length == 0){
                        await widget.changeCollection('lower');
                        await Future.delayed(Duration(seconds: 1));
                        await _loadDataFirebase(lower);
                      }
                    }
                    else{
                      if(dress.length == 0){
                        await widget.changeCollection('dress');
                        await Future.delayed(Duration(seconds: 1));
                        await _loadDataFirebase(dress);
                      }
                    }
                    setState(() {
                        showShirts = false;
                    });
                  }, 
                  child: Text(
                    showMan ? "Pents" : "Dress",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: showShirts ? kTextLightColor : kTextColor,
                    ),
                  )
                ),
                Container(
                  margin: EdgeInsets.only(top: kDefaultPaddin/4),
                  height: 2,
                  width: 30,
                  color: showShirts ? Colors.transparent : Colors.blue,
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 10,),
        Expanded(child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: GridView.builder(
            itemCount: showMan ? showShirts ? upper.length : lower.length : showShirts ? saree.length : dress.length,
            gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: kDefaultPaddin,
                crossAxisSpacing: kDefaultPaddin,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) =>
                Itemcard(
                  product: showMan ? showShirts ? upper[index] : lower[index] : showShirts ? saree[index] : dress[index],
                  press : () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailsScreen(product: showMan ? showShirts ? upper[index] : lower[index] : showShirts ? saree[index] : dress[index],)
                    )
                  ),
                ),
            ),
          ),
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app_admin/constants.dart';
import 'package:shop_app_admin/models/Product.dart';
import 'package:shop_app_admin/screens/details/details_screen.dart';
import 'package:shop_app_admin/service/database.dart';
import 'package:shop_app_admin/shared/constant.dart';

class FormScreen extends StatefulWidget {
  final Product product;

  const FormScreen({this.product});

  @override
  _FormScreenState createState() => _FormScreenState();

}

class _FormScreenState extends State<FormScreen> {
  // final Product product;

  String collectionName = 'upper';
    
  void changeCollection(String name){
    print("in change collection");
    setState(() =>  collectionName = name);
  }
  
  String _currentTitle;
  String _currentSize;
  String _currentPrice;
  String _currentID;
  String _currentImage;
  String _currentColor;
  String _currentDescription;

  final _formkey = GlobalKey<FormState>();


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.product == null ? Color(0xFF4DB6Ac) : Color(widget.product.color),

      appBar: AppBar(
        elevation: 1.0,
        leading: IconButton(icon: SvgPicture.asset('assets/icons/back.svg'), color: Colors.white,
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Add Product",
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              Container(
                height: 200,
                child: Image(
                  image: widget.product == null ? AssetImage('assets/images/bag/bag_1.png') : NetworkImage(widget.product.image)
                ),
              ),
              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text("ID : ",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: TextFormField(
                        initialValue: widget.product == null ? '' : widget.product.id,
                        decoration: textInputStyle.copyWith(hintText: "ID"),
                        validator: (val) => val.isEmpty ? "Enter ID" : null,
                        onChanged: (val) => setState(() => _currentID = val),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text("Title : ",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: TextFormField(
                        initialValue: widget.product == null ? '' : widget.product.title,
                        decoration: textInputStyle.copyWith(hintText: "Title"),
                        validator: (val) => val.isEmpty ? "Enter title" : null,
                        onChanged: (val) => setState(() => _currentTitle = val),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text("Size : ",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: TextFormField(
                        initialValue: widget.product == null ? '' : widget.product.size.toString(),
                        decoration: textInputStyle.copyWith(hintText: "Size"),
                        validator: (val) => val.isEmpty ? "Enter size" : null,
                        onChanged: (val) => setState(() => _currentSize = val),
                    ),
                  ),
                ],
              ),
              
              SizedBox(height: 10),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "Price : ",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: TextFormField(
                        initialValue: widget.product == null ? '' : widget.product.price.toString(),
                        decoration: textInputStyle.copyWith(hintText: "Price"),
                        validator: (val) => val.isEmpty ? "Enter Price" : null,
                        onChanged: (val) => setState(() => _currentPrice = val),
                    ),
                  ),
                ],
              ),
              
              SizedBox(height: 10),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "Description : ",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: TextFormField(
                        initialValue: widget.product == null ? '' : widget.product.description,
                        decoration: textInputStyle.copyWith(hintText: "Description"),
                        validator: (val) => val.isEmpty ? "Enter Description" : null,
                        onChanged: (val) => setState(() => _currentDescription = val),
                    ),
                  ),
                ],
              ),
              
              SizedBox(height: 10),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "Color : ",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: TextFormField(
                        initialValue: widget.product == null ? '' : widget.product.color.toString(),
                        decoration: textInputStyle.copyWith(hintText: "Color"),
                        validator: (val) => val.isEmpty ? "Enter Color" : null,
                        onChanged: (val) => setState(() => _currentColor = val),
                    ),
                  ),
                ],
              ),
              
              SizedBox(height: 10),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text("Image-url : ",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: TextFormField(
                        initialValue: widget.product == null ? '' : widget.product.image,
                        decoration: textInputStyle.copyWith(hintText: "image-url"),
                        validator: (val) => val.isEmpty ? "Enter Color" : null,
                        onChanged: (val) => setState(() => _currentImage = val),
                    ),
                  ),
                ],
              ),
              
              SizedBox(height: 10),
              
              RaisedButton(
                color: Colors.white,
                child: Text("Update", style: TextStyle(color: widget.product == null ? Color(0xFF4DB6AC) : Color(widget.product.color), fontSize: 20),),
                onPressed: () async {
                  if(_formkey.currentState.validate()){
                    await DatabaseService(uid: widget.product == null ? _currentID : widget.product.id).upadetProductData(
                      _currentTitle  ?? widget.product.title,
                      _currentDescription ?? widget.product.description,
                      _currentImage ?? widget.product.image, 
                      _currentID  ?? widget.product.id,
                      int.parse(_currentPrice ?? widget.product.price.toString()), 
                      int.parse(_currentSize ?? widget.product.size.toString()), 
                      int.parse(_currentColor ?? widget.product.color.toString()), 
                    );
                    print("/n you /n done /n it /n");
                    widget.product == null ? Navigator.pop(context,) :
                    Navigator.pop(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsScreen(product: widget.product,)
                      )
                    );
                  }
                },
              ),
            ],
          )
        ),
      )
    );
  }
}
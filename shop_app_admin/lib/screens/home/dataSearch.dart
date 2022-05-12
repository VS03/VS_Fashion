import 'package:flutter/material.dart';
import 'package:shop_app_admin/models/Product.dart';
import 'package:shop_app_admin/screens/details/details_screen.dart';
import 'package:shop_app_admin/screens/home/components/Item_Card.dart';
import 'package:shop_app_admin/screens/home/components/man_woman_body.dart';
import 'package:shop_app_admin/constants.dart';




class DataSearch extends SearchDelegate<String>{

  static List recentSearch = ['Formal', 'Royal', 'Sport', 'Track', 'chaniya-choli'];
  final list = Man_Woman_Body().getshowMan() ? 
                        Man_Woman_Body().getshowShirts() ? 
                          upper : lower : 
                        Man_Woman_Body().getshowShirts() ? 
                          saree : dress; 
  static List allCatogery = [];
  List l= [];

  void getname(){
    allCatogery.removeRange(0, allCatogery.length);
    for (var i = 0; i < list.length; i++) {
      allCatogery.add(list[i].title);
    }
  }

  @override
  List<Widget> buildActions(BuildContext context) {
      return [IconButton(icon: Icon(Icons.cancel), onPressed: () {
        query = '';
      } )];
    }
  
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back), 
      onPressed: () {
        close(context, null);
      }
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 10,),
        Expanded(child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: GridView.builder(
              itemCount: l.length ?? 0,
              gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: kDefaultPaddin,
                  crossAxisSpacing: kDefaultPaddin,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) =>
                  Itemcard(
                    product: l[index],
                    press : () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsScreen(product: l[index],)
                      )
                    ),
                  ),
              ),
            ),
        ),
      ],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List suggetionList = query.isEmpty ? recentSearch : allCatogery.where((element) => element.contains(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index ) => ListTile(
        onTap: () {
          query = suggetionList[index];
          recentSearch.removeLast();
          recentSearch.insert(0, query);
          for(var i = 0; i<list.length; i++){
            if(list[i].title == query){
              l.add(list[i]);
            }
          }
          showResults(context);
        },
        leading: Icon(Icons.search),
        title: query.isEmpty ? Text(suggetionList[index]) : RichText(
          text: TextSpan(
            text: suggetionList[index].substring(0, suggetionList[index].indexOf(query)),
            style: TextStyle(
              color: Colors.grey ,
            ),
            children: [
              TextSpan(
                text: suggetionList[index].substring(suggetionList[index].indexOf(query), suggetionList[index].indexOf(query)+query.length),
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                )
              ),
              TextSpan(
                text: suggetionList[index].substring(suggetionList[index].indexOf(query)+query.length),
                style: TextStyle(
                  color: Colors.grey,
                )
              ),
            ], 
          ),
        ),
      ),
      itemCount: suggetionList.length,
    ); 
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_app_admin/models/Product.dart';
import 'package:shop_app_admin/models/user.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});

  static CollectionReference collection;
  final CollectionReference userCollection = Firestore.instance.collection('user');
  final CollectionReference upperCollection = Firestore.instance.collection('upper');
  final CollectionReference lowerCollection = Firestore.instance.collection('lower');
  final CollectionReference sareeCollection = Firestore.instance.collection('saree');
  final CollectionReference dressCollection = Firestore.instance.collection('dress');

  Future upadetUserData(String email, String number) async {
    return await userCollection.document(uid).setData({
      'E-mail': email,
      'Contact': number,
    });
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot){
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      sugar: snapshot.data['sugar'],
      strength: snapshot.data['strength']
    );
  }

  List<Product> _productListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return Product(
        id: doc.data['id'],
        image: doc.data['image'],
        title: doc.data['title'],
        price: doc.data['price'],
        description: doc.data['description'],
        size: doc.data['size'],
        color: doc.data['color'],
      );
    }).toList();
  }

  Stream<List<Product>> get product {
    if(uid == 'upper')
      collection = Firestore.instance.collection('upper');
    else if(uid == 'lower')
      collection = Firestore.instance.collection('lower');
    else if(uid == 'saree'){
      collection = Firestore.instance.collection('saree');}
    else if(uid == 'dress')
      collection = Firestore.instance.collection('dress');
    else 
      return null;
    return collection.snapshots().map(_productListFromSnapshot);
  }

  Future upadetProductData(String title, String description, String image, String id, int price, int size, int color) async {

      return await collection.document(uid).setData({
        'id': id,
        'title': title,
        'color': color,
        'description': description,
        'size': size,
        'price': price,
        'image': image,
      });
  }

  Stream<UserData> get userData { 
    return userCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }
  
  Future deleteProductData() async {
    await collection.document(uid).delete();
  }
}

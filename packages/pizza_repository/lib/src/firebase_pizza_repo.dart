import 'dart:developer';
import 'dart:html' as html;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:pizza_repository/pizza_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebasePizzaRepo implements PizzaRepo {
  final pizzaCollection = FirebaseFirestore.instance.collection('pizzas');

  @override
  Future<List<Pizza>> getPizzas() async {
    try {
      return await pizzaCollection
          .get()
          .then((value) => value.docs.map((e) => Pizza.fromEntity(PizzaEntity.fromJson(e.data()))).toList());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }


  @override
  Future<String> sendImage(html.File file) async {
    try {
      Reference firebseStorageRef = FirebaseStorage.instance.ref().child(file.name);
      await firebseStorageRef.putBlob(file);
      String url = await firebseStorageRef.getDownloadURL();
      return url;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}

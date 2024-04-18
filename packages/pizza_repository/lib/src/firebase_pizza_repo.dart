import 'dart:developer';
import 'dart:html' as html;
import 'dart:typed_data';
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
  Future<String> sendImage(Uint8List file, String name) async {
    try {
      Reference firebseStorageRef = FirebaseStorage.instance.ref().child(name);
      await firebseStorageRef.putData(file);
      String url = await firebseStorageRef.getDownloadURL();
      return url;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> createPizzas(Pizza pizza) async {
    try {
      return await pizzaCollection
          .doc(pizza.pizzaId).set(pizza.toEntity().toJson());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}

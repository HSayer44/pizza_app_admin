import 'models/models.dart';
import 'dart:html' as html;

abstract class PizzaRepo {
  Future<List<Pizza>> getPizzas();
  Future<String> sendImage(html.File file);
}
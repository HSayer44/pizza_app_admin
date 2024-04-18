import 'package:uuid/uuid.dart';

import '../../pizza_repository.dart';
import 'macros.dart';

class Pizza {
  String pizzaId;
  String picture;
  bool isVeg;
  int spicy;
  String name;
  String description;
  int price;
  int discount;
  Macros macros;

  Pizza({
    required this.pizzaId,
    required this.picture,
    required this.isVeg,
    required this.spicy,
    required this.name,
    required this.description,
    required this.price,
    required this.discount,
    required this.macros,
  });

  static final empty = Pizza(
    pizzaId: const Uuid().v1(),
    picture: '',
    isVeg: false,
    spicy: 1,
    name: '',
    description: '',
    price: 0,
    discount: 0,
    macros: Macros.empty,
  );

  //take Pizza object and transform it => entity => jsonMap
  PizzaEntity toEntity() {
    return PizzaEntity(
      pizzaId: pizzaId,
      picture: picture,
      isVeg: isVeg,
      spicy: spicy,
      name: name,
      description: description,
      price: price,
      discount: discount,
      macros: macros,
    );
  }

  //have a jsonMap and transform it => entity => Pizza
  static Pizza fromEntity(PizzaEntity entity) {
    return Pizza(
      pizzaId: entity.pizzaId,
      picture: entity.picture,
      isVeg: entity.isVeg,
      spicy: entity.spicy,
      name: entity.name,
      description: entity.description,
      price: entity.price,
      discount: entity.discount,
      macros: entity.macros,
    );
  }

  //just for debugging purposes
  @override
  String toString() {
    return '''Pizza{pizzaId: $pizzaId,
    picture: $picture,
    name: $name,
    description: $description,
    price: $price,
    discount: $discount,
    isVeg: $isVeg,
    spicy: $spicy,
    macros:[
      macros: ${macros.calories}
      proteins: ${macros.proteins}
      fat: ${macros.fat}
      carbs: ${macros.carbs}
    ] ''';
  }
}

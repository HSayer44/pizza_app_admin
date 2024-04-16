class MacrosEntity {
  int calories;
  int proteins;
  int fat;
  int carbs;

  MacrosEntity({
    required this.calories,
    required this.proteins,
    required this.fat,
    required this.carbs,
  });

  Map<String, dynamic> toJson() {
    return {
      "calories": calories,
      "proteins": proteins,
      "fat": fat,
      "carbs": carbs,
    };
  }

  static MacrosEntity fromJson(Map<String, dynamic> json) {
    return MacrosEntity(
      calories: json["calories"],
      proteins: json["proteins"],
      fat: json["fat"],
      carbs: json["carbs"],
    );
  }
//
}
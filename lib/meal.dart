class Meal {
  String mealType;
  //String day;

  Meal(String mealType) {
    this.mealType = mealType;
    //this.day = day;
  }

  static List<Meal> getMealType() {
    return <Meal>[
      Meal('ארוחה מלאה (27 שח)'),
      Meal('סלט אישי (18 שח)'),
      Meal('בגט (13.5 שח)')
    ];
  }
}

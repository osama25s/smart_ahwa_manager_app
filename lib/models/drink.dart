abstract class Drink {
  String get name;

  String describe() => "Drink: $name";
}

class Tea extends Drink {
  @override
  String get name => "Shai";
}

class HibiscusTea extends Drink {
  @override
  String get name => "Hibiscus Tea";
}

class TurkishCoffee extends Drink {
  @override
  String get name => "Turkish Coffee";
}

class Espresso extends Drink {
  @override
  String get name => "Espresso";
}

class Latte extends Drink {
  @override
  String get name => "Latte";
}

class Cappuccino extends Drink {
  @override
  String get name => "Cappuccino";
}

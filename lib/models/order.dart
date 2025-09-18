import 'drink.dart';

enum OrderStatus { pending, completed }

class Order {
  String _customerName;
  Drink _drink;
  String _specialInstructions;
  OrderStatus _status;

  Order({
    required String customerName,
    required Drink drink,
    String specialInstructions = '',
  }) : _customerName = customerName,
       _drink = drink,
       _specialInstructions = specialInstructions,
       _status = OrderStatus.pending;

  String get customerName => _customerName;
  Drink get drink => _drink;
  String get specialInstructions => _specialInstructions;
  OrderStatus get status => _status;

  set customerName(String name) {
    if (name.isNotEmpty) _customerName = name;
  }

  set drink(Drink d) {
    _drink = d;
  }

  set specialInstructions(String instructions) {
    _specialInstructions = instructions;
  }

  void markCompleted() {
    _status = OrderStatus.completed;
  }

  String describe() {
    return "Customer: $_customerName, Drink: ${_drink.name}, Instructions: $_specialInstructions, Status: $_status";
  }
}

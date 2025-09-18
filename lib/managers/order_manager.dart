import 'package:smart_ahwa_manager_app/models/order.dart';

class OrderManager {
  final List<Order> _orders = [];

  void addOrder(Order order) {
    _orders.add(order);
  }

  void completeOrder(Order order) {
    order.markCompleted();
  }

  List<Order> getPendingOrders() {
    return _orders.where((o) => o.status == OrderStatus.pending).toList();
  }

  List<Order> getCompletedOrders() {
    return _orders.where((o) => o.status == OrderStatus.completed).toList();
  }

  Map<String, int> getTopSellingDrinks() {
    Map<String, int> drinkCount = {};

    for (var order in getCompletedOrders()) {
      String drinkName = order.drink.name;
      if (drinkCount.containsKey(drinkName)) {
        drinkCount[drinkName] = drinkCount[drinkName]! + 1;
      } else {
        drinkCount[drinkName] = 1;
      }
    }

    return drinkCount;
  }

  int getTotalCompletedOrders() {
    return getCompletedOrders().length;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../managers/order_manager.dart';
import '../models/drink.dart';
import '../models/order.dart';

class AddOrderScreen extends StatefulWidget {
  final OrderManager orderManager;

  const AddOrderScreen({super.key, required this.orderManager});

  @override
  State<AddOrderScreen> createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _customerController = TextEditingController();
  final TextEditingController _instructionsController = TextEditingController();

  Drink? _selectedDrink;

  final List<Drink> _drinks = [
    Tea(),
    HibiscusTea(),
    TurkishCoffee(),
    Espresso(),
    Latte(),
    Cappuccino(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: SizedBox.shrink(),
        title: const Text(
          'Add New Order',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.brown[600],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: TextFormField(
                    controller: _customerController,
                    decoration: const InputDecoration(
                      labelText: 'Customer Name',
                      border: InputBorder.none,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return 'Enter customer name';
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: DropdownButtonFormField<Drink>(
                    value: _selectedDrink,
                    items:
                        _drinks.map((drink) {
                          return DropdownMenuItem<Drink>(
                            value: drink,
                            child: Text(drink.name),
                          );
                        }).toList(),
                    decoration: const InputDecoration(
                      labelText: 'Select Drink',
                      border: InputBorder.none,
                    ),
                    onChanged:
                        (value) => setState(() => _selectedDrink = value),
                    validator: (value) {
                      if (value == null) return 'Select a drink';
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: TextFormField(
                    controller: _instructionsController,
                    decoration: const InputDecoration(
                      labelText: 'Special Instructions',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final order = Order(
                        customerName: _customerController.text,
                        drink: _selectedDrink!,
                        specialInstructions: _instructionsController.text,
                      );
                      widget.orderManager.addOrder(order);
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown[600],
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  child: Text(
                    'Add Order',
                    style: TextStyle(fontSize: 18.sp, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

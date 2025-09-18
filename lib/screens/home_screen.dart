import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../managers/order_manager.dart';
import '../widgets/order_tile.dart';
import 'add_order_screen.dart';
import 'report_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final OrderManager _orderManager = OrderManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[900],
        title: Text(
          'Smart Ahwa Manager',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _orderManager.getPendingOrders().isEmpty
                  ? SizedBox.shrink()
                  : Text(
                    'Pending Orders',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              SizedBox(height: 12.h),
              Expanded(
                child:
                    _orderManager.getPendingOrders().isEmpty
                        ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.coffee_rounded, color: Colors.grey),
                              Text(
                                'No Pending Orders',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        )
                        : ListView.builder(
                          itemCount: _orderManager.getPendingOrders().length,
                          itemBuilder: (context, index) {
                            final order =
                                _orderManager.getPendingOrders()[index];
                            return OrderTile(
                              order: order,
                              onComplete: () {
                                setState(() {
                                  _orderManager.completeOrder(order);
                                });
                              },
                            );
                          },
                        ),
              ),

              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown, // غير اللون هنا حسب رغبتك
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 12.h,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (_) =>
                                  AddOrderScreen(orderManager: _orderManager),
                        ),
                      ).then((_) => setState(() {}));
                    },
                    child: Text(
                      'Add Order',
                      style: TextStyle(fontSize: 18.sp, color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown, // غير اللون هنا حسب رغبتك
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 12.h,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (_) => ReportScreen(orderManager: _orderManager),
                        ),
                      );
                    },
                    child: Text(
                      'Reports',
                      style: TextStyle(fontSize: 18.sp, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

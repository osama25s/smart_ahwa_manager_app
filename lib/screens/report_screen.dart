import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../managers/order_manager.dart';

class ReportScreen extends StatelessWidget {
  final OrderManager orderManager;

  const ReportScreen({super.key, required this.orderManager});

  @override
  Widget build(BuildContext context) {
    final topSelling = orderManager.getTopSellingDrinks();
    final totalCompleted = orderManager.getTotalCompletedOrders();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          'Daily Report',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        leading: BackButton(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.brown[600],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  color: Colors.brown[50],
                  child: Padding(
                    padding: EdgeInsets.all(16.w),
                    child: Text(
                      'Total Completed Orders: $totalCompleted',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown[800],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Text(
              'Top-Selling Drinks:',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.brown[700],
              ),
            ),
            SizedBox(height: 12.h),
            Expanded(
              child: ListView(
                children:
                    topSelling.entries.map((entry) {
                      return Card(
                        elevation: 2,
                        margin: EdgeInsets.symmetric(vertical: 6.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 8.h,
                          ),
                          title: Text(
                            entry.key,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          trailing: Text(
                            entry.value.toString(),
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.brown[600],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../models/order.dart';

class OrderTile extends StatelessWidget {
  final Order order;
  final VoidCallback onComplete;

  const OrderTile({super.key, required this.order, required this.onComplete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 4.h),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      shadowColor: Colors.brown.withOpacity(0.3),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order.customerName,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown[800],
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'Drink: ${order.drink.name}',
                  style: TextStyle(fontSize: 17.sp, color: Colors.brown[700]),
                ),
                if (order.specialInstructions.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.only(top: 4.h),
                    child: Text(
                      'Instructions: ${order.specialInstructions}',
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                SizedBox(height: 8.h),
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child:
                  order.status == OrderStatus.pending
                      ? ElevatedButton(
                        onPressed: onComplete,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown[600],
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 8.h,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        child: Text(
                          'Complete',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white,
                          ),
                        ),
                      )
                      : const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 28,
                      ),
            ),
          ],
        ),
      ),
    );
  }
}

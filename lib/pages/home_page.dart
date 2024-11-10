import 'package:flutter/material.dart';

import '../custome/custome_button.dart';

class LessonOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('اختار نوع الحساب للبدء'),backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomButton(
                  icon: Icons.person,
                  label: 'حساب العميل',
                  onPressed: () => Navigator.pushNamed(context, '/RegisterCustomer'),
                  color: Colors.blue,
                ),
                const SizedBox(height: 20),
                CustomButton(
                  icon: Icons.work,
                  label: 'حساب الحرفي',
                  onPressed: () => Navigator.pushNamed(context, '/RegisterCraftsman'),
                  color: Colors.orange,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class OrdersManagementScreen extends StatefulWidget {
  const OrdersManagementScreen({super.key});

  @override
  State<OrdersManagementScreen> createState() => _OrdersManagementScreenState();
}

class _OrdersManagementScreenState extends State<OrdersManagementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: StretchedButton(
          onPressed: () {},
          child: Text(
            "اررسال طلب جديد",
            style: TextStyle(
              color: context.colorPalette.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        leading: const CustomBack(),
        title: const AppBarText("ادارة الطلبيات"),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: 10,
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        itemBuilder: (context, index) {
          return Container(
            width: double.infinity,
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: context.colorPalette.greyF2F,
              borderRadius: BorderRadius.circular(kRadiusSecondary),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "طلب رقم 1731524#",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: context.colorPalette.black001,
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Container(
                  height: 25,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                    color: context.colorPalette.yellowC39,
                    borderRadius: BorderRadius.circular(kRadiusPrimary),
                  ),
                  child: Text(
                    "بالإنتظار",
                    style: TextStyle(
                      color: context.colorPalette.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

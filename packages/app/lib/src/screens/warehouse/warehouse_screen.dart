import 'package:app/shared.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class WarehouseScreen extends StatefulWidget {
  const WarehouseScreen({super.key});

  @override
  State<WarehouseScreen> createState() => _WarehouseScreenState();
}

class _WarehouseScreenState extends State<WarehouseScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      children: [
        Row(
          children: [
            WarehouseButton(
              onTap: () {},
              title: "اصناف بحاجة تزويد",
              value: "(45) ",
              icon: MyIcons.boxTime,
            ),
            const SizedBox(width: 10),
            WarehouseButton(
              onTap: () {},
              title: "اضافة كمية للمخزون",
              icon: MyIcons.boxAdd,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              WarehouseButton(
                onTap: () {
                  context.push((context) => const DepartmentItemManagementScreen());
                },
                title: "ادارة الأقسام والأصناف",
                icon: MyIcons.department,
              ),
              const SizedBox(width: 10),
              WarehouseButton(
                onTap: () {
                  context.push((context) => const OrdersManagementScreen());
                },
                title: "ادارة الطلبيات",
                icon: MyIcons.truckTime,
              ),
            ],
          ),
        ),
        Row(
          children: [
            WarehouseButton(
              onTap: () {},
              flex: 4,
              title: "سجل العمليات",
              icon: MyIcons.book,
            ),
            const SizedBox(width: 10),
            WarehouseButton(
              onTap: () {},
              flex: 3,
              backgroundColor: context.colorPalette.redC33,
              title: "إتلاف اصناف",
              icon: MyIcons.trash,
            ),
            const SizedBox(width: 10),
            WarehouseButton(
              onTap: () {},
              flex: 2,
              backgroundColor: context.colorPalette.grey780,
              title: "نقل مواد",
              icon: MyIcons.truck,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: TextEditor(
            onChanged: (value) {},
            required: false,
            hintText: "ابحث عن صنف",
            hintStyle: TextStyle(
              color: context.colorPalette.grey666,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            prefixIcon: const IconButton(
              onPressed: null,
              icon: CustomSvg(MyIcons.search),
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                "اصناف بحاجة إلى تزويد",
                style: TextStyle(
                  color: context.colorPalette.black001,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  Text(
                    "المزيد",
                    style: TextStyle(
                      color: context.colorPalette.black001,
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Icon(Icons.arrow_forward_ios_outlined),
                ],
              ),
            ),
          ],
        ),
        const MaterialsTable(),
      ],
    );
  }
}

import 'package:app/screens_exports.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      children: [
        Row(
          children: [
            Expanded(
              child: TaskCard(
                onTap: () {},
                title: "المهمة الحالية",
                task: "التحضير لوجبة الإفطار",
                value: "02 : 31 : 56",
                valueIcon: MyIcons.timer,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TaskCard(
                onTap: () {},
                title: "المهمة التالية",
                task: "تجهيز وجبة الإفطار",
                value: "30 : 06 صباحاً",
                valueColor: context.colorPalette.black001,
                valueIcon: MyIcons.clock,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Expanded(
                child: TaskCard(
                  onTap: () {},
                  title: "رصيد العهدة",
                  task: "43,590 ريال",
                  prefixIcon: MyIcons.wallet,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TaskCard(
                  onTap: () {},
                  title: "المخزون",
                  task: "لديك اصناف بحاجة لتزويد",
                  prefixIcon: MyIcons.box,
                  taskColor: context.colorPalette.redC10,
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: TaskCard(onTap: () {}, title: "الكادر البشري", prefixIcon: MyIcons.people),
            ),
            const SizedBox(width: 10),
            Expanded(child: TaskCard(onTap: () {}, title: "التقارير", prefixIcon: MyIcons.reports)),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: TaskCard(
            onTap: () {},
            title: "رسائل إدارية",
            expandedTask: true,
            task:
                "يرجى الإلتزام بمواعيد تقديم الوجبات وحسن التعامل مع حجاج بيت الله ، شاكرين لكم تعاونكم وجزاكم الله خير الجزاء.",
          ),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: context.colorPalette.greyF2F,
            borderRadius: BorderRadius.circular(kRadiusSecondary),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 45,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: context.colorPalette.grey708,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(kRadiusSecondary),
                    topRight: Radius.circular(kRadiusSecondary),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "مهامي",
                        style: TextStyle(
                          color: context.colorPalette.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: context.colorPalette.white,
                      ),
                    ),
                  ],
                ),
              ),
              ListView.separated(
                separatorBuilder: (context, index) => Divider(color: context.colorPalette.greyC4C),
                itemCount: 4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 5),
                itemBuilder: (context, index) {
                  return const MyTask();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

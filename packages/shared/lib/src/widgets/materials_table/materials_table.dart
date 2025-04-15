import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class MaterialsTable extends StatelessWidget {
  const MaterialsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 45,
          margin: const EdgeInsets.only(top: 10, bottom: 5),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: context.colorPalette.grey74D,
            borderRadius: BorderRadius.circular(kRadiusSecondary),
          ),
          child: const Row(
            children: [
              Expanded(flex: 2, child: TableText("#")),
              Expanded(flex: 14, child: TableText("اسم الصنف")),
              CustomLine(),
              Expanded(
                flex: 4,
                child: TableText("متوفر", textAlign: TextAlign.center),
              ),
              CustomLine(),
              Expanded(
                flex: 4,
                child: TableText("الحد", textAlign: TextAlign.center),
              ),
              CustomLine(),
              Expanded(
                flex: 4,
                child: TableText("الحالة", textAlign: TextAlign.center),
              ),
            ],
          ),
        ),
        ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 5),
          itemCount: 10,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
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
                  const Expanded(flex: 2, child: TableText("45")),
                  const Expanded(
                    flex: 14,
                    child: TableText("ارز حبة طويلة ( 10 كغ )"),
                  ),
                  const CustomLine(),
                  const Expanded(
                    flex: 4,
                    child: TableText("91", textAlign: TextAlign.center),
                  ),
                  const CustomLine(),
                  const Expanded(
                    flex: 4,
                    child: TableText("100", textAlign: TextAlign.center),
                  ),
                  const CustomLine(),
                  Expanded(
                    flex: 4,
                    child: Container(
                      height: 24,
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: context.colorPalette.redC10,
                        borderRadius: BorderRadius.circular(kRadiusPrimary),
                      ),
                      child: Text(
                        "بحاجة",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: context.colorPalette.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

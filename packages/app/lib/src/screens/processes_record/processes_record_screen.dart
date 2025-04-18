import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class ProcessesRecordScreen extends StatefulWidget {
  const ProcessesRecordScreen({super.key});

  @override
  State<ProcessesRecordScreen> createState() => _ProcessesRecordScreenState();
}

class _ProcessesRecordScreenState extends State<ProcessesRecordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const CustomBack(),
        title: const AppBarText("سجل عمليات المخزون"),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 0),
        itemCount: 5,
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        itemBuilder: (context, index) {
          return Row(
            children: [
              CustomSvg(
                index == 0
                    ? MyIcons.minusSquare
                    : index == 1
                    ? MyIcons.closeSquare
                    : MyIcons.addSquare,
              ),
              const SizedBox(width: 10),
              const Expanded(child: ProcessCard()),
            ],
          );
        },
      ),
    );
  }
}

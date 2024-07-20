import 'package:flutter/material.dart';
import 'dart:math';
import 'package:provider/provider.dart';
import 'package:test_work/models/history_model.dart';

class SheetWidget extends StatelessWidget {
  SheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Random random = Random();

    int squareCount = random.nextInt(20) + 1;

    final selectionHistory =
        Provider.of<SelectionHistory>(context, listen: false);

    return Container(
        width: double.infinity,
        color: Colors.red,
        child: ListView.builder(
            itemCount: squareCount,
            itemBuilder: (context, index) {
              void sheetClose() {
                Navigator.pop(context);
                selectionHistory.addItem((index + 1).toString());
              }

              return GestureDetector(
                onTap: () => sheetClose(),
                child: Container(
                  height: 100,
                  color: Colors.red,
                  child: Center(
                    child: Text(
                      "Квадратик №${index + 1}",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              );
            }));
  }
}

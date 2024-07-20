import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_work/models/history_model.dart';
import 'package:test_work/widgets/sheet_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _openSheet() {
    showModalBottomSheet(context: context, builder: (builder) => SheetWidget());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Flutter test"),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: _openSheet,
            child: const Text("Выбрать квадратик"),
          ),
        ),
        bottomNavigationBar: BottomAppBar(child: Consumer<SelectionHistory>(
            builder: (context, selectionHistory, child) {
          return Wrap(
            children: List.generate(
              selectionHistory.history.length,
              (index) {
                return Text(
                  '${selectionHistory.history[index]}${index == selectionHistory.history.length - 1 ? '' : ', '}',
                  style: TextStyle(fontSize: 16),
                );
              },
            ),
          );
        })));
  }
}

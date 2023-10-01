import 'package:flutter/material.dart';
import 'package:mad_week5_widgets_project/widget_data.dart';

class WidgetDetailsScreen extends StatelessWidget {
  const WidgetDetailsScreen({super.key, required this.widgetData});

  final WidgetData widgetData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widgetData.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widgetData.description, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            const Text("Code: ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(
              widgetData.code,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

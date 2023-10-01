import 'package:flutter/material.dart';
import 'package:mad_week5_widgets_project/data/stateful_widget_data.dart';
import 'package:mad_week5_widgets_project/screens/stateful/stateful_widget_details_page.dart';

class StateFulWidgetListDetails extends StatelessWidget {
  const StateFulWidgetListDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("StateFul Widget List"),
      ),
      body: ListView.builder(
        itemCount: stateFulWidgetList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(stateFulWidgetList[index].name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StateFulWidgetDetailsScreen(
                    widgetData: stateFulWidgetList[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mad_week5_widgets_project/data/stateless_widget_data.dart';
import 'package:mad_week5_widgets_project/screens/stateless/stateless_widget_details_page.dart';

/*
class WidgetList extends StatefulWidget {
  const WidgetList({super.key});

  @override
  State<WidgetList> createState() => _WidgetListState();
}

class _WidgetListState extends State<WidgetList> {
  bool isExpanded = false;
  int selectedIndex = -1;

  void toggleExpansion(int index) {
    setState(() {
      if (selectedIndex == index) {
        isExpanded = !isExpanded;
      } else {
        isExpanded = true;
        selectedIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widgetList.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            margin: const EdgeInsets.all(8),
            child: Column(
              children: [
                ListTile(
                  title: Text(widgetList[index].name),
                  onTap: () => toggleExpansion(index),
                ),
                if (isExpanded && selectedIndex == index)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(widgetList[index].description),
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(widgetList[index].code),
                      )
                    ],
                  )
              ],
            ),
          );
        });
  }
}
*/


class StateLessWidgetListDetails extends StatelessWidget {
  const StateLessWidgetListDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StateLess Widgets List', textAlign: TextAlign.center),
      ),
      body: ListView.builder(
        itemCount: stateLessWidgetList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(stateLessWidgetList[index].name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StateLessWidgetDetailsScreen(
                    widgetData: stateLessWidgetList[index],
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
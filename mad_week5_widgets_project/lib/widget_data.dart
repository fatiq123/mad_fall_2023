class WidgetData {
  final String name;
  final String description;
  final String code;

  WidgetData(this.name, this.description, this.code);
}

List<WidgetData> widgetList = [
  WidgetData(
      'Row Widget', 'Row Widget organize its children in a Row.', """const Row(
  children: <Widget>[
    Expanded(
      child: Text('Deliver features faster', textAlign: TextAlign.center),
    ),
    Expanded(
      child: Text('Craft beautiful UIs', textAlign: TextAlign.center),
    ),
    Expanded(
      child: FittedBox(
        child: FlutterLogo(),
      ),
    ),
  ],
)"""),
  WidgetData('2', 'Column', 'no code still'),
  WidgetData('3', 'Container', 'no code still'),
];

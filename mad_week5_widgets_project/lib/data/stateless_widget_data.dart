class StateLessWidgetData {
  final String name;
  final String description;
  final String code;

  StateLessWidgetData(this.name, this.description, this.code);
}

List<StateLessWidgetData> stateLessWidgetList = [
  StateLessWidgetData(
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
  StateLessWidgetData(
      'Column Widget', 'Column Widget organize its children in a Column', """
      const Column(
  children: <Widget>[
    Text('Deliver features faster'),
    Text('Craft beautiful UIs'),
    Expanded(
      child: FittedBox(
        child: FlutterLogo(),
      ),
    ),
  ],
)
      """),
  StateLessWidgetData(
      'Container Widget',
      'A convenience widget that combines common painting, positioning, and sizing widgets.',
      """
      Center(
  child: Container(
    margin: const EdgeInsets.all(10.0),
    color: Colors.amber[600],
    width: 48.0,
    height: 48.0,
  ),
)
  """),
];

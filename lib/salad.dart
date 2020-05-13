import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:grouped_checkbox/grouped_checkbox.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'main.dart';

void main() => runApp(Salad());

class Salad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grouped Checkbox Demo',
      theme: ThemeData.dark(),
      home: Directionality(
          textDirection: TextDirection.rtl,
          child: MyHomePage(title: 'הזמנת ארוחת צהרים - הוט מובייל')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> allItemList = [
    'סלט ירקות בתוספת חזה עוף על הפלנצה',
    'סלט ירקות בתוספת שניצל עוף בייתי',
  ];

  List<String> _checked = []; //["A", "B"];
  //String _picked = "Two";
  bool _termsChecked = false;
  bool checkboxValue = false;
  static List<String> checkedItemList = [];

  List<String> _selectedItemList = checkedItemList ?? [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Directionality(
            textDirection: TextDirection.rtl,
            child: GroupedCheckbox(
              itemList: allItemList,
              checkedItemList: checkedItemList,
              disabled: ['Black'],
              onChanged: (itemList) {
                setState(() {
                  if (_selectedItemList.length > 1) {
                    _selectedItemList.removeAt(0);
                  }
                  _selectedItemList = itemList;
                  print('SELECTED ITEM LIST $itemList');
                  //FlutterOpenWhatsapp.sendSingleMessage(
                  //  "972532211321", itemList.toString());
                });
              },
              orientation: CheckboxOrientation.VERTICAL,
              checkColor: Colors.blue,
              activeColor: Colors.red,
            ),
          ),
          RaisedButton(
            onPressed: () {
              if (_selectedItemList.length == 0) {
              } else {
                FlutterOpenWhatsapp.sendSingleMessage(
                    "972523000195",
                    fullNameController.text +
                        ", " +
                        personalIdController.text +
                        "\n" +
                        _selectedItemList
                            .toString()
                            .replaceAll("[", "")
                            .replaceAll("]", ""));
              }
              ;
              /*...*/
            },
            child: Text(
              "שליחה",
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:grouped_checkbox/grouped_checkbox.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'main.dart';
import 'dart:ui';

void main() => runApp(FullMealWednesday());

class FullMealWednesday extends StatelessWidget {
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
  List<String> saladsList = [
    'סלט חומוס בעיטור שמן זית',
    'סלט ירקות ישראלי',
    'טחינה גלילית',
    'מיקס חמוצי הבית',
    'סלט קוסלאו באיולי מיונז וצילי',
  ];

  List<String> carboList = [
    'אורז צהוב',
    'שעועית ירוקה ברוטב עגבניות מסורתי',
    'קוביות תפווח אדמה ובטטה אפויים בטימין ושמן זית',
  ];

  List<String> mainCourseList = [
    'מדליוני כתף עגל ברוטב פטריות וציר מח עצמות',
    'חזה עוף במרינאדה פפריקה ושום צלוי על הפלנצה',
    'שווארמה פרגיות',
    'שניצל עוף ביתי',
    'שניצל תירס',
  ];

  List<String> dessertList = [
    'עוגה',
    'פרי העונה ולחם',
  ];

  List<String> _checked = []; //["A", "B"];
  //String _picked = "Two";
  bool _termsChecked = false;
  bool checkboxValue = false;
  static List<String> checkedItemList1 = [];
  static List<String> checkedItemList2 = [];
  static List<String> checkedItemList3 = [];
  static List<String> checkedItemList4 = [];

  List<String> _selectedItemList1 = checkedItemList1 ?? [];
  List<String> _selectedItemList2 = checkedItemList2 ?? [];
  List<String> _selectedItemList3 = checkedItemList3 ?? [];
  List<String> _selectedItemList4 = checkedItemList4 ?? [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text('בר סלטים, 4 לבחירה:',
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
                style: TextStyle(color: Colors.deepOrange)),
            Directionality(
              textDirection: TextDirection.rtl,
              child: GroupedCheckbox(
                itemList: saladsList,
                checkedItemList: checkedItemList1,
                disabled: ['Black'],
                onChanged: (itemList1) {
                  setState(() {
                    if (_selectedItemList1.length > 4) {
                      _selectedItemList1.removeAt(0);
                    }
                    _selectedItemList1 = itemList1;
                    print('SELECTED ITEM LIST $itemList1');
                    //FlutterOpenWhatsapp.sendSingleMessage(
                    //  "972532211321", itemList.toString());
                  });
                },
                orientation: CheckboxOrientation.VERTICAL,
                checkColor: Colors.blue,
                activeColor: Colors.red,
              ),
            ),
            Text('תוספות חמות, 2 לבחירה:',
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
                style: TextStyle(color: Colors.deepOrange)),
            Directionality(
              textDirection: TextDirection.rtl,
              child: GroupedCheckbox(
                itemList: carboList,
                checkedItemList: checkedItemList2,
                disabled: ['Black'],
                onChanged: (itemList2) {
                  setState(() {
                    if (_selectedItemList2.length > 2) {
                      _selectedItemList2.removeAt(0);
                    }
                    _selectedItemList2 = itemList2;
                    print('SELECTED ITEM LIST $itemList2');
                    //FlutterOpenWhatsapp.sendSingleMessage(
                    //  "972532211321", itemList.toString());
                  });
                },
                orientation: CheckboxOrientation.VERTICAL,
                checkColor: Colors.blue,
                activeColor: Colors.red,
              ),
            ),
            Text('מנה עיקרית:',
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
                style: TextStyle(color: Colors.deepOrange)),
            Directionality(
              textDirection: TextDirection.rtl,
              child: GroupedCheckbox(
                itemList: mainCourseList,
                checkedItemList: checkedItemList3,
                disabled: ['Black'],
                onChanged: (itemList3) {
                  setState(() {
                    if (_selectedItemList3.length > 1) {
                      _selectedItemList3.removeAt(0);
                    }
                    _selectedItemList3 = itemList3;
                    print('SELECTED ITEM LIST $itemList3');
                    //FlutterOpenWhatsapp.sendSingleMessage(
                    //  "972532211321", itemList.toString());
                  });
                },
                orientation: CheckboxOrientation.VERTICAL,
                checkColor: Colors.blue,
                activeColor: Colors.red,
              ),
            ),
            Text('קינוחים:',
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
                style: TextStyle(color: Colors.deepOrange)),
            Directionality(
              textDirection: TextDirection.rtl,
              child: GroupedCheckbox(
                itemList: dessertList,
                checkedItemList: checkedItemList4,
                disabled: ['Black'],
                onChanged: (itemList4) {
                  setState(() {
                    if (_selectedItemList4.length > 1) {
                      _selectedItemList4.removeAt(0);
                    }
                    _selectedItemList4 = itemList4;
                    print('SELECTED ITEM LIST $itemList4');
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
                if (_selectedItemList1.length == 0) {
                  print("empty");
                } else {
                  FlutterOpenWhatsapp.sendSingleMessage(
                      "972523000195",
                      fullNameController.text +
                          ", " +
                          personalIdController.text +
                          "\n\n" +
                          "*מנה עיקרית:*" +
                          "\n" +
                          _selectedItemList3
                              .toString()
                              .replaceAll("[", "")
                              .replaceAll("]", "")
                              .replaceAll(",", "\n") +
                          "\n\n" +
                          "*תוספות חמות, 2 לבחירה:*" +
                          "\n" +
                          _selectedItemList2
                              .toString()
                              .replaceAll("[", "")
                              .replaceAll("]", "")
                              .replaceAll(",", "\n") +
                          "\n\n" +
                          "*בר סלטים, 4 לבחירה:*" +
                          "\n" +
                          _selectedItemList1
                              .toString()
                              .replaceAll("[", "")
                              .replaceAll("]", "")
                              .replaceAll(",", "\n") +
                          "\n\n" +
                          "*קינוחים:*" +
                          "\n" +
                          _selectedItemList4
                              .toString()
                              .replaceAll("[", "")
                              .replaceAll("]", "")
                              .replaceAll(",", "\n"));
                }
                ;
                /*...*/
              },
              child: Text(
                "שליחה",
              ),
            )
          ],
        ),
      ),
    );
  }
}

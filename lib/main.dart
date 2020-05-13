import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hotlunchorderapp/Baget.dart';
import 'full_meal_monday.dart';
import 'full_meal_sunday.dart';
import 'full_meal_tuesday.dart';
import 'full_meal_wednesday.dart';
import 'package:hotlunchorderapp/salad.dart';
import 'full_meal_thursday.dart';
import 'package:intl/intl.dart' as direct;
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

String curDate = new direct.DateFormat.EEEE().format(new DateTime.now());

TextEditingController fullNameController = new TextEditingController();
TextEditingController personalIdController = new TextEditingController();

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text(
              'הזמנת ארוחת צהרים - הוט מובייל',
            ),
          ),
          body: SafeArea(
            child: Center(
              child: Column(
                children: <Widget>[
                  Expanded(
                      flex: 2,
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: TextFormField(
                          controller: fullNameController,
                          //keyboardType: TextInputType.visiblePassword,
                          // obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'שם מלא',
                          ),
                        ),
                      )),
                  Expanded(
                      flex: 2,
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: TextField(
                          controller: personalIdController,
                          keyboardType: TextInputType.number,
                          // obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'תעודת זהות',
                          ),
                        ),
                      )),
                  Expanded(
                    flex: 1,
                    child: Center(
                        child: Text(
                      '(' + curDate + ')',
                      style: TextStyle(color: Colors.teal.shade200),
                    )),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.red.shade500,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: FlatButton(
                        onPressed: () {
                          if (personalIdController.text.isEmpty ||
                              fullNameController.text.isEmpty) {
                            print("empty");
                          } else {
                            {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Salad()));
                            }
                          }
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Center(
                              child: Text(
                                'סלט אישי',
                                style: TextStyle(
                                  fontSize: 40.0,
                                ),
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                            Center(
                              child: Text(
                                '18 ש"ח',
                                style: TextStyle(fontSize: 15.0),
                                //textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.red.shade500,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: FlatButton(
                        onPressed: () {
                          if (personalIdController.text.isEmpty ||
                              fullNameController.text.isEmpty) {
                            print("empty");
                          } else {
                            {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Baget()));
                            }
                          }
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Center(
                              child: Text(
                                'בגט',
                                style: TextStyle(
                                  fontSize: 40.0,
                                ),
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                            Center(
                              child: Text(
                                '13.5 ש"ח',
                                style: TextStyle(fontSize: 15.0),
                                //textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.red.shade500,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: FlatButton(
                        onPressed: () {
                          if (personalIdController.text.isEmpty ||
                              fullNameController.text.isEmpty) {
                            print("empty");
                          } else {
                            switch (curDate) {
                              case 'Sunday':
                                {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              FullMealSunday()));
                                }
                                break;
                              case 'Monday':
                                {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              FullMealMonday()));
                                }
                                break;
                              case 'Tuesday':
                                {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              FullMealTuesday()));
                                }
                                break;
                              case 'Wednesday':
                                {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              FullMealWednesday()));
                                }
                                break;
                              case 'Thursday':
                                {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              FullMealThursday()));
                                }
                                break;
                            }
                          }
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Center(
                              child: Text(
                                'ארוחה מלאה',
                                style: TextStyle(
                                  fontSize: 40.0,
                                ),
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                            Center(
                              child: Text(
                                '27 ש"ח',
                                style: TextStyle(fontSize: 15.0),
                                //textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Developed by Kobi David',
                      style: TextStyle(fontFamily: 'Pangolin'),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}

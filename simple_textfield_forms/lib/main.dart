import 'package:flutter/material.dart';

import 'ui/widgets/text_field.dart';
import 'ui/widgets/text_field_with_controller.dart';
import 'ui/widgets/text_form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'TextFields & Forms',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //home: TextFieldExamples()
        //home: TextFieldWithController()
        home: TextFormExample());
  }
}

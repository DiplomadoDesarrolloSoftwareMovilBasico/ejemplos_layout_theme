import 'package:flutter/material.dart';

class TextFieldExamples extends StatefulWidget {
  const TextFieldExamples({Key? key}) : super(key: key);

  @override
  _TextFieldExamplesState createState() => _TextFieldExamplesState();
}

class _TextFieldExamplesState extends State<TextFieldExamples> {
  String textOutputonSubmitted = "";
  String textOutputChanged = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple TextField'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('${textOutputonSubmitted}'),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Some text here',
              ),
              onSubmitted: (text) {
                setState(() {
                  textOutputonSubmitted = text;
                });
              },
              onChanged: (value) {
                setState(() {
                  textOutputChanged = value;
                });
              },
            ),
            Text('${textOutputChanged}'),
          ],
        ),
      ),
    );
  }
}

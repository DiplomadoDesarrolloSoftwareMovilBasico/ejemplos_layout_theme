import 'package:flutter/material.dart';

class TextFieldWithController extends StatefulWidget {
  TextFieldWithController({Key? key}) : super(key: key);

  @override
  _TextFieldWithControllerState createState() =>
      _TextFieldWithControllerState();
}

class _TextFieldWithControllerState extends State<TextFieldWithController> {
  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextField with controller"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Some text here',
              ),
            ),
            TextButton(
                onPressed: () async {
                  await showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Thanks!'),
                        content: Text('You typed "${_textController.text}"'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text("Press me"))
          ],
        ),
      ),
    );
  }
}

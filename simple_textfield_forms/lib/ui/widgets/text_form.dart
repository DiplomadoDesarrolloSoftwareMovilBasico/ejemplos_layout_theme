import 'package:flutter/material.dart';

class TextFormExample extends StatefulWidget {
  TextFormExample({Key? key}) : super(key: key);

  @override
  _TextFormExampleState createState() => _TextFormExampleState();
}

class _TextFormExampleState extends State<TextFormExample> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("Form example")),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 12.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                "Login with email",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter email";
                  } else if (!value.contains('@')) {
                    return "Enter valid email address";
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: this._passwordController,
                decoration: InputDecoration(labelText: "Password"),
                keyboardType: TextInputType.number,
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter password";
                  } else if (value.length < 6) {
                    return "Password should have at least 6 characters";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              OutlinedButton(
                  onPressed: () {
                    // this line dismiss the keyboard by taking away the focus of the TextFormField and giving it to an unused
                    FocusScope.of(context).requestFocus(FocusNode());
                    final form = _formKey.currentState;
                    form!.save();
                    if (form.validate()) {
                      final snackBar = SnackBar(
                        content: Text('Validation ok'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      final snackBar = SnackBar(
                        content: Text('Validation nok'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: Text("Submit")),
            ],
          ),
        ),
      ),
    );
  }
}

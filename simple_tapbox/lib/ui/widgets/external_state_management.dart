import 'package:flutter/material.dart';

class ExternalStateManagement extends StatefulWidget {
  ExternalStateManagement({Key? key}) : super(key: key);

  @override
  _ExternalStateManagementState createState() =>
      _ExternalStateManagementState();
}

class _ExternalStateManagementState extends State<ExternalStateManagement> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        color: Colors.red,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TapboxB(
            active: _active,
            onChanged: _handleTapboxChanged,
          ),
        ),
      ),
    );
  }
}

//------------------------- TapboxB ----------------------------------

class TapboxB extends StatelessWidget {
  const TapboxB({
    Key? key,
    this.active = false,
    required this.onChanged,
  }) : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            active ? 'Active' : 'Inactive',
            style: const TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}

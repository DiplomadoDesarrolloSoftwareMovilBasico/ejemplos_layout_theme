import 'dart:async';

import 'package:flutter/material.dart';

class StopWatch extends StatefulWidget {
  @override
  _StopWatchState createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  late Timer timer;
  int milliseconds = 0;
  int seconds = 0;
  bool working = false;

  void _onTick(Timer time) {
    setState(() {
      milliseconds += 100;
    });
  }

  void _start() {
    print('start');
    timer = Timer.periodic(Duration(milliseconds: 100), _onTick);
    setState(() {
      working = true;
    });
  }

  void _stop() {
    print('stop');
    timer.cancel();
    setState(() {
      working = false;
    });
  }

  void _clear() {
    print('clear');
    timer.cancel();
    setState(() {
      milliseconds = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('StopWatch',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontWeight: FontWeight.bold)),
            Text('${milliseconds} ms',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Colors.red)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  style: working
                      ? ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.grey),
                        )
                      : ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green),
                        ),
                  onPressed: () => working ? null : _start(),
                  icon: Icon(Icons.play_arrow),
                  label: Text('Play'),
                ),
                ElevatedButton.icon(
                    style: working
                        ? ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red),
                          )
                        : ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.grey),
                          ),
                    icon: Icon(Icons.stop),
                    onPressed: () => working ? _stop() : null,
                    label: Text('Stop')),
                ElevatedButton.icon(
                    style: working
                        ? ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.grey),
                          )
                        : ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue),
                          ),
                    icon: Icon(Icons.clear),
                    onPressed: () => working ? null : _clear(),
                    label: Text('Clear')),
              ],
            )
          ],
        ),
      ),
    );
  }
}

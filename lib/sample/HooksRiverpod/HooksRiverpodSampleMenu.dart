import 'package:flutter/material.dart';
import 'HookWidgetSample.dart';
import 'HookUseEffect.dart';

class HooksRiverpodSampleMenu extends StatelessWidget {
  const HooksRiverpodSampleMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: <Widget>[
        ElevatedButton(
          child: const Text('Simple Sample'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HookWidgetSample()),
            );
          },
        ),
        ElevatedButton(
          child: const Text('Hook UseEffect'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const HookUseEffect(title: "Hook UseEffect")),
            );
          },
        ),
      ]),
    );
  }
}

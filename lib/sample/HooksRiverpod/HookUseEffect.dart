import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/cupertino.dart';

UseCounter useCounter() {
  final counter = useState(0);
  void increment() {
    counter.value++;
  }

  return UseCounter(count: counter.value, increment: increment);
}

class UseCounter {
  final int count;
  final void Function() increment;
  UseCounter({required this.count, required this.increment});
}

class HookUseEffect extends HookWidget {
  final String title;
  const HookUseEffect({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final state = useCounter();

    //使用UseEffect，来一直观察着要观察的数
    //useEffect(Dispose? Function() effect, [List<Object?>? keys]
    useEffect(() {
      if (state.count % 10 == 0) {
        Future.microtask(() => showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => CupertinoAlertDialog(
                  title: Text("${state.count}になりました"),
                  actions: [
                    CupertinoDialogAction(
                      child: const Text('close'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                )));
      }
    },
        //被观察的对象list
        [state.count]);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${state.count}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: state.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

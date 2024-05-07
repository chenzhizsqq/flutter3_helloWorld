import 'package:flutter/cupertino.dart';

class FirstRouteCupertinoButton extends StatelessWidget {
  const FirstRouteCupertinoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('First Route'),
      ),
      child: Center(
        child: CupertinoButton(
          child: const Text('Open route'),
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) => const SecondRouteCupertinoButton()),
            );
          },
        ),
      ),
    );
  }
}

class SecondRouteCupertinoButton extends StatelessWidget {
  const SecondRouteCupertinoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Second Route'),
      ),
      child: Center(
        child: CupertinoButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}

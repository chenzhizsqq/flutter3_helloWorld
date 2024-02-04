import 'package:flutter/material.dart';

class ChatGptSample extends StatelessWidget {
  const ChatGptSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChatGPT Sample'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('test'),
          onPressed: () {},
        ),
      ),
    );
  }
}

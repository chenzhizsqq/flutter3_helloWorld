import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';

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

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';

//https://pub.aimind.so/step-by-step-guide-to-integrating-openai-api-in-flutter-f85cb0856a9d
class ApiKey {
  static const String openAIApiKey = "YOUR_API_KEY";
}

class ChatService {
  static final Uri chatUri =
      Uri.parse('https://api.openai.com/v1/chat/completions');

  static final Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ${ApiKey.openAIApiKey}',
  };

  Future<String?> request(String prompt) async {
    try {
      ChatRequest request = ChatRequest(
          model: "gpt-3.5-turbo",
          maxTokens: 150,
          messages: [Message(role: "system", content: prompt)]);
      if (prompt.isEmpty) {
        return null;
      }
      http.Response response = await http.post(
        chatUri,
        headers: headers,
        body: request.toJson(),
      );
      ChatResponse chatResponse = ChatResponse.fromResponse(response);
      print(chatResponse.choices?[0].message?.content);
      return chatResponse.choices?[0].message?.content;
    } catch (e) {
      print("error ！！！ $e");
    }
    return null;
  }
}

class ChatRequest {
  final String model;
  final List<Message> messages;
  final int? maxTokens;
  final double? temperature;
  final int? topP;
  final int? n;
  final bool? stream;
  final double? presencePenalty;
  final double? frequencyPenalty;
  final String? stop;

  ChatRequest({
    required this.model,
    required this.messages,
    this.maxTokens,
    this.temperature,
    this.topP,
    this.n,
    this.stream,
    this.presencePenalty,
    this.frequencyPenalty,
    this.stop,
  });

  String toJson() {
    Map<String, dynamic> jsonBody = {
      'model': model,
      'messages': List<Map<String, dynamic>>.from(
          messages.map((message) => message.toJson())),
    };
    if (maxTokens != null) {
      jsonBody.addAll({'max_tokens': maxTokens});
    }

    if (temperature != null) {
      jsonBody.addAll({'temperature': temperature});
    }

    if (topP != null) {
      jsonBody.addAll({'top_p': topP});
    }

    if (n != null) {
      jsonBody.addAll({'n': n});
    }

    if (stream != null) {
      jsonBody.addAll({'stream': stream});
    }

    if (presencePenalty != null) {
      jsonBody.addAll({'presence_penalty': presencePenalty});
    }

    if (frequencyPenalty != null) {
      jsonBody.addAll({'frequency_penalty': frequencyPenalty});
    }

    if (stop != null) {
      jsonBody.addAll({'stop': stop});
    }

    return json.encode(jsonBody);
  }
}

class Message {
  final String? role;
  final String? content;

  Message({this.role, this.content});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      role: json['role'],
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'role': role,
      'content': content,
    };
  }
}

class ChatResponse {
  final String? id;
  final String object;
  final int? created;
  final String? model;
  final List<Choice>? choices;
  final Usage usage;

  const ChatResponse({
    required this.id,
    required this.object,
    required this.created,
    required this.model,
    required this.choices,
    required this.usage,
  });

  factory ChatResponse.fromResponse(Response response) {
    String responseBody = utf8.decode(response.bodyBytes);
    Map<String, dynamic> parsedBody = json.decode(responseBody);
    return ChatResponse(
      id: parsedBody['id'],
      object: parsedBody['object'],
      created: parsedBody['created'],
      model: parsedBody['model'],
      choices: List<Choice>.from(
          parsedBody['choices'].map((choice) => Choice.fromJson(choice))),
      usage: Usage.fromJson(parsedBody['usage']),
    );
  }
}

class Choice {
  final int? index;
  final Message? message;
  final String? finishReason;

  Choice(this.index, this.message, this.finishReason);

  factory Choice.fromJson(Map<String, dynamic> json) {
    return Choice(
      json['index'],
      Message.fromJson(json['message']),
      json['finish_reason'],
    );
  }
}

class Usage {
  final int? promptTokens;
  final int? completionTokens;
  final int? totalTokens;

  Usage({this.promptTokens, this.completionTokens, this.totalTokens});

  factory Usage.fromJson(Map<String, dynamic> json) {
    return Usage(
      promptTokens: json['prompt_tokens'],
      completionTokens: json['completion_tokens'],
      totalTokens: json['total_tokens'],
    );
  }
}

//
// class ChatGptSample extends StatelessWidget {
//   const ChatGptSample({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('ChatGPT Sample'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           child: const Text('test'),
//           onPressed: () {},
//         ),
//       ),
//     );
//   }
// }

//OpenAIEntryScreen
class ChatGptSample extends StatefulWidget {
  const ChatGptSample({super.key});

  @override
  State<ChatGptSample> createState() => _ChatGptSampleState();
}

class _ChatGptSampleState extends State<ChatGptSample> {
  TextEditingController promptController = TextEditingController();
  String? response;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: promptController,
              maxLines: 1,
              decoration: const InputDecoration(
                labelText: "Prompt",
                hintText: "Enter your prompt here",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              response ?? "",
              style: TextStyle(color: Colors.grey.shade800),
            ),
          ),
          ElevatedButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 20)),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.deepPurple)),
              onPressed: () async {
                print("promptController.text !!!");
                print(promptController.text);
                response = await ChatService().request(promptController.text);
                setState(() {});
              },
              child: const Text(
                "Submit",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}

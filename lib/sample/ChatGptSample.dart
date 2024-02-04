import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class ChatGptSample extends StatefulWidget {
  const ChatGptSample({Key? key}) : super(key: key);

  @override
  _ChatGptSampleState createState() => _ChatGptSampleState();
}

class _ChatGptSampleState extends State<ChatGptSample> {
  var imageUrl = '';
  var textForGenerationImageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Generation'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: Image.network(imageUrl)),
          TextField(
            autofocus: true,
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.black,
            ),
            controller: textForGenerationImageController,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Type text to generate image!',
            ),
          ),
          IconButton(
              onPressed: () async {
                String url = await generateImageFromText(
                    textForGenerationImageController.text);
                setState(() {
                  imageUrl = url;
                });
              },
              icon: const Icon(Icons.send)),
        ],
      ),
    );
  }

  Future<String> generateImageFromText(String text) async {
    String apiKey =
        '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'; // ここをAPIキーに差し替え
    var dio = Dio();
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey'
    };

    try {
      Response response = await dio.post(
        'https://api.openai.com/v1/images/generations',
        data: {
          'prompt': text,
          'n': 1,
          'size': '1024x1024',
        },
      );
      var generatedImageUrl = response.data['data'][0]['url'];
      print('generatedImageUrl:' + generatedImageUrl);
      return generatedImageUrl;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }
}

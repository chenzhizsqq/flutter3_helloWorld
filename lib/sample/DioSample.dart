import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioSample extends StatefulWidget {
  const DioSample({Key? key}) : super(key: key);

  @override
  State<DioSample> createState() => _DioSampleState();
}

class _DioSampleState extends State<DioSample> {
  var jsonList;
  @override
  void initState() {
    super.initState();

    getData();
  }

  Future<void> getData() async {
    try {
      // APIからの応答を保持する変数
      final response = await Dio()
          .get('https://protocoderspoint.com/jsondata/superheros.json');
      if (response.statusCode == 200) {
        setState(() {
          jsonList = response.data['superheros'] as List;
          print(jsonList);
        });
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print("getData catch:");
      print(e);
      //DioException [connection error]
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GeeksForGeeks',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: jsonList == null ? 0 : jsonList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(80),
                child: Image.network(
                  jsonList[index]['url'],
                  fit: BoxFit.fill,
                  width: 50,
                  height: 50,
                ),
              ),
              title: Text(jsonList[index]['name']),
              subtitle: Text(jsonList[index]['power']),
            ));
          }),
    );
  }
}

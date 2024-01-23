import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class SharedPreferencesSample extends StatefulWidget {
  const SharedPreferencesSample({Key? key}) : super(key: key);

  @override
  _SharedPreferencesSampleState createState() =>
      _SharedPreferencesSampleState();
}

class _SharedPreferencesSampleState extends State<SharedPreferencesSample> {
  // 初期値を表示するための変数
  String textInit = "初期値";

  // 値を入力するための変数
  final TextEditingController _nameController = TextEditingController();

  // ドキュメント通りに、prefs.setStringで、String型のデータを保存
  _saveData() async {
    // _nameControllerを代入する
    String nameValue = _nameController.text;
    final prefs = await SharedPreferences.getInstance();
    // nameValueを"name"がキーのprefs.setStringで使う。
    await prefs.setString("name", nameValue);
  }

  // ドキュメント通りに、prefs.getStringでString型のデータを取得
  _getData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      textInit = prefs.getString("name") ?? "値が入っていない!";
    });
  }

  // ドキュメント通りに、prefs.remove("keyの名前")で、ローカルのデータを削除
  // 今回だと、("name")がkeyのデータを削除する
  _removeData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("name");
    setState(() {
      textInit = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("ローカルにデータを保存"),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            Text(
              textInit,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: "お名前を入力してください"),
              controller: _nameController,
            ),
            Row(
              children: [
                const SizedBox(width: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue, // background
                    onPrimary: Colors.white, // foreground
                  ),
                  onPressed: _saveData,
                  child: Text('保存'),
                ),
                const SizedBox(width: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green, // background
                    onPrimary: Colors.white, // foreground
                  ),
                  onPressed: _getData,
                  child: Text('表示'),
                ),
                const SizedBox(width: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red, // background
                    onPrimary: Colors.white, // foreground
                  ),
                  onPressed: _removeData,
                  child: Text('削除'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// class FirebaseSample extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               child: Text('ログイン'),
//               onPressed: () async {
//                 await Navigator.of(context).pushReplacement(
//                   MaterialPageRoute(builder: (context) {
//                     return LoginPage();
//                   }),
//                 );
//               },
//             ),
//             Padding(padding: EdgeInsets.all(20)),
//             ElevatedButton(
//               child: Text('アカウント作成'),
//               onPressed: () async {
//                 await Navigator.of(context).pushReplacement(
//                   MaterialPageRoute(builder: (context) {
//                     return RegisterPage();
//                   }),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class RegisterPage extends StatefulWidget {
//   @override
//   _RegisterPageState createState() => _RegisterPageState();
// }
//
// class _RegisterPageState extends State<RegisterPage> {
//   // メッセージ表示用
//   String infoText = '';
//   // 入力したメールアドレス・パスワード
//   String email = '';
//   String password = '';
//   String userName = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           padding: EdgeInsets.all(24),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               // メールアドレス入力
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'メールアドレス'),
//                 onChanged: (String value) {
//                   setState(() {
//                     email = value;
//                   });
//                 },
//               ),
//               // パスワード入力
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'パスワード'),
//                 obscureText: true,
//                 onChanged: (String value) {
//                   setState(() {
//                     password = value;
//                   });
//                 },
//               ),
//               Container(
//                 padding: EdgeInsets.all(8),
//                 // メッセージ表示
//                 child: Text(infoText),
//               ),
//               Container(
//                 width: double.infinity,
//                 // ユーザー登録ボタン
//                 child: ElevatedButton(
//                   child: Text('ユーザ登録'),
//                   onPressed: () async {
//                     try {
//                       // メール/パスワードでユーザ登録
//                       final FirebaseAuth auth = FirebaseAuth.instance;
//                       await auth.createUserWithEmailAndPassword(
//                         email: email,
//                         password: password,
//                       );
//
//                       // ユーザー登録に成功した場合
//                       await Navigator.of(context).pushReplacement(
//                         MaterialPageRoute(builder: (context) {
//                           return FirebaseSample();
//                         }),
//                       );
//                     } catch (e) {
//                       // ユーザー登録に失敗した場合
//                       setState(() {
//                         infoText = "登録に失敗しました：${e.toString()}";
//                       });
//                     }
//                   },
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.all(8),
//               ),
//               Container(
//                 width: double.infinity,
//                 // ユーザー登録ボタン
//                 child: ElevatedButton(
//                   child: Text('戻る'),
//                   onPressed: () async {
//                     await Navigator.of(context).pushReplacement(
//                       MaterialPageRoute(builder: (context) {
//                         return FirebaseSample();
//                       }),
//                     );
//                   },
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   // メッセージ表示用
//   String infoText = '';
//   // 入力したメールアドレス・パスワード
//   String email = '';
//   String password = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           padding: EdgeInsets.all(24),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               // メールアドレス入力
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'メールアドレス'),
//                 onChanged: (String value) {
//                   setState(() {
//                     email = value;
//                   });
//                 },
//               ),
//               // パスワード入力
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'パスワード'),
//                 obscureText: true,
//                 onChanged: (String value) {
//                   setState(() {
//                     password = value;
//                   });
//                 },
//               ),
//               Container(
//                 padding: EdgeInsets.all(8),
//                 // メッセージ表示
//                 child: Text(infoText),
//               ),
//               Container(
//                 width: double.infinity,
//                 // ユーザー登録ボタン
//                 child: ElevatedButton(
//                   child: Text('ログイン'),
//                   onPressed: () async {
//                     try {
//                       // メール/パスワードでログイン
//                       final FirebaseAuth auth = FirebaseAuth.instance;
//                       await auth.signInWithEmailAndPassword(
//                         email: email,
//                         password: password,
//                       );
//                       // ユーザー登録に成功した場合
//                       setState(() {
//                         infoText = "ログインに成功しました";
//                       });
//                     } catch (e) {
//                       // ユーザー登録に失敗した場合
//                       setState(() {
//                         infoText = "登録に失敗しました：${e.toString()}";
//                       });
//                     }
//                   },
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.all(8),
//               ),
//               Container(
//                 width: double.infinity,
//                 // ユーザー登録ボタン
//                 child: ElevatedButton(
//                   child: Text('戻る'),
//                   onPressed: () async {
//                     await Navigator.of(context).pushReplacement(
//                       MaterialPageRoute(builder: (context) {
//                         return FirebaseSample();
//                       }),
//                     );
//                   },
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

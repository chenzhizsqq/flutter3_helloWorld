// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
//
// // [START listen_to_realtime_updates_listen_for_updates2]
// class FirebaseFirestoreStream extends StatefulWidget {
//   @override
//   _FirebaseFirestoreStreamState createState() =>
//       _FirebaseFirestoreStreamState();
// }
//
// class _FirebaseFirestoreStreamState extends State<FirebaseFirestoreStream> {
//   final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
//       .collection("users")
//       .doc('id_abc')
//       .collection('orders')
//       .snapshots();
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: _usersStream,
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return const Text('Something went wrong');
//         }
//
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Text("Loading");
//         }
//
//         return ListView(
//           children: snapshot.data!.docs
//               .map((DocumentSnapshot document) {
//                 Map<String, dynamic> data =
//                     document.data()! as Map<String, dynamic>;
//                 return ListTile(
//                   title: Text(data['date']),
//                   trailing: Text("${data['price']}"),
//                 );
//               })
//               .toList()
//               .cast(),
//         );
//       },
//     );
//   }
// }
// // [END listen_to_realtime_updates_listen_for_updates2]

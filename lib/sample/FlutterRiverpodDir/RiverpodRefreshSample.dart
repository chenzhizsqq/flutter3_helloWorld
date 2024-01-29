import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'dart:convert';

//import 'package:flutter/material.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;
//import 'package:riverpod_annotation/riverpod_annotation.dart';

class RiverpodRefreshSample extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RiverpodRefresh Sample'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Counter
            Text(
              'RiverpodRefreshSample:',
            ),
          ],
        ),
      ),
    );
  }
}

//https://riverpod.dev/zh-hans/docs/case_studies/pull_to_refresh
//一定要运行一下的命令行，不然Freezed不能够使用!!!!
// % flutter pub run build_runner build
//
/*
part 'codegen.g.dart';
part 'codegen.freezed.dart';
class RiverpodRefreshSample extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activity = ref.watch(activityProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Pull to refresh')),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(activityProvider.future),
        child: ListView(
          children: [
            switch (activity) {
              AsyncValue<Activity>(:final valueOrNull?) =>
                Text(valueOrNull.activity),
              AsyncValue(:final error?) => Text('Error: $error'),
              _ => const CircularProgressIndicator(),
            },
          ],
        ),
      ),
    );
  }
}

@riverpod
Future<Activity> activity(ActivityRef ref) async {
  final response = await http.get(
    Uri.https('www.boredapi.com', '/api/activity'),
  );

  final json = jsonDecode(response.body) as Map;
  return Activity.fromJson(Map.from(json));
}

@freezed
class Activity with _$Activity {
  factory Activity({
    required String activity,
    required String type,
    required int participants,
    required double price,
  }) = _Activity;

  factory Activity.fromJson(Map<String, dynamic> json) =>
      _$ActivityFromJson(json);
}
*/

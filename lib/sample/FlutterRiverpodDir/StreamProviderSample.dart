import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 模拟一个异步获取数据的函数
Future<int> fetchDataFromDatabase() async {
  // 这里模拟一个异步操作，比如从数据库中读取数据
  await Future.delayed(const Duration(seconds: 2));
  return 42; // 返回模拟的数据
}

// 创建一个 StreamProvider，提供从数据库中获取数据的流
final streamProvider = StreamProvider<int>((ref) async* {
  // 在这里使用 async* 来创建一个异步生成器
  // 在异步生成器中，可以使用 yield 发出多个值，这些值会被作为流的事件发出
  // 这里我们使用 yield* 来将 fetchDataFromDatabase() 返回的 Future<int> 转换成流
  yield* fetchDataFromDatabase().asStream();
});

class StreamProviderSample extends ConsumerWidget {
  const StreamProviderSample({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 通过 ref.watch() 来订阅流，当流中有新的数据时，会触发重新构建UI
    final countAsyncValue = ref.watch(streamProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('StreamProvider Example'),
      ),
      body: Center(
        child: countAsyncValue.when(
          // 根据异步值的状态来显示不同的UI
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Text('Error: $error'),
          data: (count) =>
              Text('Count: $count', style: const TextStyle(fontSize: 40)),
        ),
      ),
    );
  }
}

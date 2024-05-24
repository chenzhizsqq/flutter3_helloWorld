import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 定义一个带有 AutoDispose 的 StateProvider
final autoDisposeCounterProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
});

/**
 * 在这个示例中，autoDisposeCounterProvider 是一个带有 AutoDispose 功能的 StateProvider。
 * 当 CounterScreen 被关闭时，autoDisposeCounterProvider 会自动释放其状态，
 * 因此当你再次打开 CounterScreen 时，计数器会重新初始化。
 * 通过这种方式，确保了不必要的状态不会长期占用内存。
 * 
 * AutoDispose 是一种用于自动释放资源的 Provider。
 * 它会在 Provider 不再被使用时自动释放资源，从而避免内存泄漏和资源泄漏的问题。
 * AutoDispose 通常用于管理订阅、定时器等需要手动释放的资源。
 */ ///
class AutoDisposeSample extends ConsumerWidget {
  const AutoDisposeSample({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(autoDisposeCounterProvider);
    final counterNotifier = ref.read(autoDisposeCounterProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
      ),
      body: Center(
        child: Text('Count: $count', style: const TextStyle(fontSize: 40)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterNotifier.state++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

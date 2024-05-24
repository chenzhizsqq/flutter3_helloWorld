import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final configProvider = Provider<Config>((ref) {
  return Config(apiKey: '12345', baseUrl: 'https://api.example.com');
});

class Config {
  final String apiKey;
  final String baseUrl;

  Config({required this.apiKey, required this.baseUrl});
}

// 使用 Provider 提供的对象
// class ProviderSample extends ConsumerWidget {
//   const ProviderSample({super.key});
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final config = ref.watch(configProvider);
//     return Text('API Key: ${config.apiKey}');
//   }
// }

class ProviderSample extends ConsumerWidget {
  const ProviderSample({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(configProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Config Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('API Key: ${config.apiKey}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Text('Base URL: ${config.baseUrl}', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}

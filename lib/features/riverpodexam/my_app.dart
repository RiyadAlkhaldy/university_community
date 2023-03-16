import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyAppp extends StatelessWidget {
  const MyAppp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Home());
  }
}

/// Providers are declared globally and specify how to create a state
final counterProvider = StateProvider((ref) => 0);

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("hello");
    return Scaffold(
      body: Center(
        // Consumer is a widget that allows you reading providers.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(
              builder: (context, ref, _) {
                final count = ref.watch(counterProvider);
                print("hellooo");

                return Text('$count');
              },
            ),
            FloatingActionButton(
              // The read method is a utility to read a provider without listening to it
              onPressed: () {
                ref.read(counterProvider.notifier).state++;
                print("hello");
              },
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // The read method is a utility to read a provider without listening to it
        onPressed: () {
          ref.read(counterProvider.notifier).state++;
          print("hello");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

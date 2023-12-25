import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getMessageStream() {
    final messages = [
      'Loading content...',
      'Please wait...',
      'Almost there...',
      'Buy me a coffee while you wait...',
      'Still loading...',
    ];
    return Stream.periodic(const Duration(seconds: 2), (x) => messages[x % 5]);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircularProgressIndicator(),
        const SizedBox(height: 10),
        StreamBuilder(
          stream: getMessageStream(),
          builder: (context, snapshot) {
            return Text(snapshot.data ?? '');
          },
        )
      ],
    ));
  }
}

import 'package:flutter/material.dart';

class UnknownPage extends StatelessWidget {
  const UnknownPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('404 Not Found')),
      body: const Center(
        child: Text(
          'This page does not exist!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

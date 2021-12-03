import 'package:count_islands/count_islands.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: const Center(
        child: SizedBox(
          width: 275,
          child: SizeForm(),
        ),
      ),
    );
  }
}

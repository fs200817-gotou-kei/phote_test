import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class EstimateContent extends StatelessWidget {
  const EstimateContent(this.name);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KEI'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(name),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_app/components/app_header.dart';

class EstimateCreate extends StatelessWidget {
  const EstimateCreate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppHeader(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Create'),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_app/model/work_site.dart';
import 'package:test_app/ui/form_screen.dart';

class EditScreen extends StatefulWidget {
  late WorkSite worksite;
  EditScreen({super.key, required this.worksite});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("現場情報編集")),
      body: Container(
        child: Column(
          children: [
            FormScreen(widget.worksite),
          ],
        ),
      ),
    );
  }
}

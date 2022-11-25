import 'package:flutter/material.dart';
import 'package:test_app/api/api_service.dart';
import 'package:test_app/model/work_site.dart';
import 'package:test_app/ui/edit_screen.dart';
import 'package:test_app/ui/home_screen.dart';

class ContentScreen extends StatefulWidget {
  final WorkSite worksite;
  // TODO:idを受け取るようにしてこっちでとったほうがよさそう
  ContentScreen({super.key, required this.worksite});

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  late ApiService apiService;

  @override
  void initState() {
    this.apiService = ApiService();
  }

  void _showDialog() async {
    await showDialog(
        context: context,
        builder: (_) {
          return SimpleDialog(
            title: const Text("確認"),
            children: [
              Text("本当にこの現場情報を削除しますか?"),
              ElevatedButton(
                  onPressed: () => Navigator.pop(context), child: Text("いいえ")),
              ElevatedButton(
                  onPressed: () {
                    this.apiService.delteWorkSite(widget.worksite.id!);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: Text("はい"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("現場情報詳細")),
      body: ListView(children: [
        Text("現場名称"),
        Text(widget.worksite.name.toString()),
        Text("施工箇所"),
        Text(widget.worksite.subName.toString()),
        Text("種別"),
        Text(widget.worksite.type.toString()),
        Text("担当者名"),
        Text(widget.worksite.staffName.toString()),
        Text("現場写真"),
        Text(widget.worksite.staffName.toString()),
        Text("住所"),
        Text(widget.worksite.address.toString()),
        Text("ステータス"),
        Text(widget.worksite.status.toString()),
        Text("開始日"),
        Text(widget.worksite.startAt.toString()),
        Text("終了日"),
        // Text(widget.worksite.updatedAt.toString()),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          EditScreen(worksite: widget.worksite)));
            },
            child: Text("編集する")),
        ElevatedButton(
            onPressed: () {
              _showDialog();
            },
            child: Text("削除する"))
      ]),
    );
  }
}

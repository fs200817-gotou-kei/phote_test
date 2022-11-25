import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor = Colors.red;

  const AppHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          const Text('見積管理アプリ'),
          Row(
            children: [
              OutlinedButton(onPressed: () {}, child: const Text('見積検索')),
              OutlinedButton(onPressed: () {}, child: const Text('見積登録'))
            ],
          )
        ],
      ),
      backgroundColor: backgroundColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

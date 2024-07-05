import 'package:flutter/material.dart';
import '../../const/color.dart';

class MenberBT extends StatelessWidget {
  const MenberBT({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // ボタンが押された時の処理をここに追加
        },
        style: ElevatedButton.styleFrom(
          primary: HomeColor.menberBt, // 背景色
          onPrimary: HomeColor.font, // フォント色
          minimumSize: Size(150, 60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9),
            side: BorderSide(color: HomeColor.border),
          ),
        ),
        child: Text(
          "To Day's \n MENBERS",
          style: TextStyle(fontSize: 25),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

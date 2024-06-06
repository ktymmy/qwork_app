import 'package:flutter/material.dart';
import 'package:qwork_app/database/emp_database.dart';
import '../../api/sinup_api.dart';
import '../../const/color.dart';
import '../../const/image.dart';
import './signin.dart';

class Confirmation extends StatelessWidget {
  Confirmation(this.post);
  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(child: Logo.logo),
                const SizedBox(height: 60),
                customConfirmation(label: "姓", data: post.fName),
                customConfirmation(label: "名", data: post.gName),
                customConfirmation(label: "従業員ID", data: post.empId.toString()),
                customConfirmation(label: "パスワード", data: post.pass),
                const SizedBox(height: 60),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      await postDataToServer(
                        int.parse(post.empId.toString()),
                        post.fName,
                        post.gName,
                        post.pass,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('新規登録が成功しました')),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignIn()),
                      );
                    } catch (error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('登録に失敗しました: $error')),
                      );
                    }
                  },
                  child: Text(
                    '新規登録',
                    style: TextStyle(fontSize: 24),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: SignUpColor.confirmationBT,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(42.5),
                    ),
                    minimumSize: Size(358.07, 85), // 幅358.07、高さ85
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget customConfirmation({
    required String label,
    required String data,
  }) {
    return SizedBox(
      height: 90,
      width: 272,
      child: Table(
        children: [
          TableRow(
            children: [
              Text(
                '$label \t: ',
                style: TextStyle(color: SignUpColor.labelText, fontSize: 14),
              ),
              Text(
                data,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

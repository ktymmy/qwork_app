//ログイン
import 'package:flutter/material.dart';

import '../../const/color.dart';
import '../../const/image.dart';
import './signup.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => SignInState();
}

class SignInState extends State<SignIn> {
  final _signInKey = GlobalKey<FormState>();

  final TextEditingController _empIdController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

//パスワードの目のicon分岐
  bool _isObscurePass = true;
  bool _isObscureCheck = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.main,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(child: Logo.logo),
                Form(
                  key: _signInKey,
                  child: Column(
                    children: [
                      formCustom(
                          controller: _empIdController,
                          labelText: "従業員番号",
                          keyboardType: TextInputType.number),
                      const SizedBox(
                        height: 20,
                      ),
                      formCustom(
                          controller: _passController,
                          labelText: "パスワード",
                          keyboardType: TextInputType.visiblePassword)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 358,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_signInKey.currentState!.validate()) {
                        // final empId = int.parse(_empIdController.text);

                        // final pass = _passController.text;

                        // final postModel = PostModel(
                        //   empId: empId,

                        //   pass: pass,
                        // );
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => Confirmation(postModel)),
                        // );
                      }
                    },
                    child: Text(
                      'Quick workを始める',
                      style: TextStyle(fontSize: 24),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: SignInColor.confirmationBT,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(42.5)),
                      minimumSize: Size(358.07, 85), // 幅358.07、高さ85
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 358,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUp()),
                          );
                        },
                        child: Text(
                          "新規アカウント登録 →",
                          style: TextStyle(color: SignInColor.pageRoute),
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget formCustom({
    required TextEditingController controller,
    required String labelText,
    bool isPassword = false,
    bool obscureText = false,
    Widget? suffixIcon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return SizedBox(
      width: 272,
      child: Column(
        children: [
          Align(
              alignment: Alignment(-1, 0),
              child: Text(
                labelText,
                style: const TextStyle(color: SignInColor.labelText),
              )),
          TextFormField(
            controller: controller,
            decoration: const InputDecoration(
              filled: true,
              fillColor: SignInColor.fillColor,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: SignInColor.outlineBorder,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: SignInColor.outlineBorder),
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            ),
          )
        ],
      ),
    );
  }
}

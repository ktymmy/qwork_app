import 'package:flutter/material.dart';
import '../../const/color.dart';
import '../../const/image.dart';
import '../../database/emp_database.dart';
import 'confirmation.dart';
import '../../api/empid_api.dart';
import './validator.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  final _signUpKey = GlobalKey<FormState>();
  final TextEditingController _fNameController = TextEditingController();
  final TextEditingController _gNameController = TextEditingController();
  final TextEditingController _empIdController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _passCheckController = TextEditingController();

  bool _isObscurePass = true;
  bool _isObscureCheck = true;
  bool? isIdCheck;
  // bpp? _empIdError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(child: Logo.logo),
                const SizedBox(height: 20),
                Form(
                  key: _signUpKey,
                  child: Column(
                    children: [
                      customTextFormField(
                        controller: _fNameController,
                        labelText: '姓',
                        hintText: '山田',
                      ),
                      customTextFormField(
                        controller: _gNameController,
                        labelText: '名',
                        hintText: '太郎',
                      ),
                      const SizedBox(height: 25),
                      customTextFormField(
                        controller: _empIdController,
                        labelText: '従業員番号',
                        keyboardType: TextInputType.number,
                        isId: true,
                        suffixIcon: isIdCheck == true
                            ? Icon(
                                Icons.check_circle,
                                color: Colors.green,
                              )
                            : null,
                        onChanged: (value) async {
                          isIdCheck = await validateEmpId(value);
                          print("isIdCheck = $isIdCheck");

                          setState(() {});
                        },
                      ),
                      Container(),
                      if (isIdCheck == false)
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "既に使用されているIDです",
                            style: TextStyle(color: Colors.red, fontSize: 10),
                          ),
                        ),
                      const SizedBox(height: 25),
                      customTextFormField(
                        controller: _passController,
                        labelText: 'パスワード',
                        isPassword: true,
                        obscureText: _isObscurePass,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscurePass
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: _isObscurePass
                                ? SignUpColor.visibilityOff
                                : SignUpColor.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscurePass = !_isObscurePass;
                            });
                          },
                        ),
                      ),
                      customTextFormField(
                        controller: _passCheckController,
                        labelText: 'パスワード再入力',
                        isPassword: true,
                        obscureText: _isObscureCheck,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscureCheck
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: _isObscureCheck
                                ? SignUpColor.visibilityOff
                                : SignUpColor.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscureCheck = !_isObscureCheck;
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: () async {
                          if (_signUpKey.currentState!.validate()) {
                            if (isIdCheck == true) {
                              final empId = int.parse(_empIdController.text);
                              final fName = _fNameController.text;
                              final gName = _gNameController.text;
                              final pass = _passController.text;

                              final postModel = PostModel(
                                empId: empId,
                                fName: fName,
                                gName: gName,
                                pass: pass,
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Confirmation(postModel)),
                              );
                            }
                          }
                        },
                        child: Text(
                          '確認画面',
                          style: TextStyle(fontSize: 24),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: SignUpColor.confirmationBT,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(42.5)),
                          minimumSize: Size(358.07, 85), // 幅358.07、高さ85
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget customTextFormField({
    required TextEditingController controller,
    required String labelText,
    String hintText = "",
    bool isPassword = false,
    bool obscureText = false,
    bool isId = false,
    Widget? suffixIcon,
    TextInputType keyboardType = TextInputType.text,
    void Function(String)? onChanged,
  }) {
    return SizedBox(
      width: 272,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: const TextStyle(color: SignUpColor.labelText),
          ),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: SignUpColor.outlineBorder)),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: SignUpColor.outlineBorder)),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              suffixIcon: suffixIcon,
            ),
            keyboardType: keyboardType,
            obscureText: obscureText,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '入力してください';
              }

              if (isPassword) {
                if (_passCheckController.text != _passController.text) {
                  return 'パスワードが一致しません';
                }
                if (value.length < 8) {
                  return '文字数が足りません';
                }
              }
              return null;
            },
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}

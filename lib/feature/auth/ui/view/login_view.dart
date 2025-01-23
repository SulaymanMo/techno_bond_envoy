import 'package:sizer/sizer.dart';
import '../widget/login_form.dart';
import 'package:flutter/material.dart';
import '../../../../core/constant/const_string.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: const Alignment(0, -.2),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(6.w),
          child: Column(
            spacing: 8.h,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(ImgPath.logo, height: 42.w),
              const LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:sizer/sizer.dart';
import 'package:techno_bond_envoy/core/constant/extension.dart';
import '../manager/auth_cubit.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import '../../../../core/common/input.dart';
import '../../../../lang/locale_keys.g.dart';
import '../../data/model/request_login.dart';
import '../../../../core/helper/show_msg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constant/const_string.dart';
import 'package:easy_localization/easy_localization.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _hidePass = true;
  late final TextEditingController _phone;
  late final TextEditingController _password;
  late final GlobalKey<FormState> _formKey;
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey();
    _phone = TextEditingController();
    _password = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _phone.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Input(
            label: context.tr(LocaleKeys.phone),
            prefix: Iconsax.mobile,
            validator: _validatePhone,
            controller: _phone,
            keyboardType: TextInputType.phone,
          ),
          SizedBox(height: 1.5.h),
          Input(
            label: context.tr(LocaleKeys.password),
            prefix: Iconsax.lock,
            suffix: IconButton(
              onPressed: () {
                setState(() {
                  _hidePass = !_hidePass;
                });
              },
              icon: Icon(_hidePass ? Iconsax.eye_slash : Iconsax.eye),
            ),
            validator: _validatePassword,
            controller: _password,
            obscureText: _hidePass,
            keyboardType: TextInputType.visiblePassword,
          ),
          SizedBox(height: 8.h),
          BlocConsumer<AuthCubit, AuthState>(
            listener: (_, state) {
              if (state is AuthFailure) {
                showMsg(context, msg: state.error);
              } else if (state is AuthSuccess) {
                context.nav.pushNamedAndRemoveUntil(
                  RoutePath.home,
                  (_) => false,
                );
              }
            },
            builder: (_, state) {
              return ElevatedButton(
                onPressed: () async => await _login(context),
                child: state is AuthLoading
                    ? const CircularProgressIndicator()
                    : Text(context.tr(LocaleKeys.continueAction)),
              );
            },
          ),
        ],
      ),
    );
  }

  Future<void> _login(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      await context.read<AuthCubit>().login(
            RequestLogin(
              phone: _phone.text.trim(),
              password: _password.text.trim(),
            ),
          );
    }
    _autovalidateMode = AutovalidateMode.always;
    setState(() {});
  }

  String? _validatePhone(String? val) {
    String? value = val?.trim();
    if (value == null || value.isEmpty) {
      return 'يرجى إدخال رقم الجوال';
    }
    return null;
  }

  String? _validatePassword(String? val) {
    String? value = val?.trim();
    if (value == null || value.isEmpty) {
      return 'يرجى إدخال كلمة المرور';
    }
    return null;
  }
}

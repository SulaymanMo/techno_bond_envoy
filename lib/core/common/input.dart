import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  const Input({
    this.maxLines,
    this.label,
    this.suffix,
    this.prefix,
    this.enabled,
    this.readOnly,
    this.onSaved,
    this.fillColor,
    this.validator,
    this.onTap,
    this.onChanged,
    this.controller,
    this.keyboardType,
    this.hint,
    this.onFieldSubmitted,
    this.obscureText = false,
    super.key,
  });

  final int? maxLines;
  final bool? readOnly;
  final bool? enabled;
  final String? label;
  final String? hint;
  final Widget? suffix;
  final IconData? prefix;
  final Color? fillColor;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final void Function()? onTap;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      onFieldSubmitted: onFieldSubmitted,
      readOnly: readOnly ?? false,
      onSaved: onSaved,
      onChanged: onChanged,
      controller: controller,
      style: TextStyle(
        fontSize: 15.5.sp,
        letterSpacing: .3,
        fontWeight: FontWeight.w400,
        // color: Colory.text.color,
      ),
      onTapOutside: (val) => FocusManager.instance.primaryFocus!.unfocus(),
      validator: validator,
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      enabled: enabled,
      maxLines: obscureText == true ? 1 : maxLines ?? 1,
      decoration: InputDecoration(
        hintText: hint,
        label: label != null ? Text(label!) : null,
        isDense: label != null ? false : true,
        // isDense: isDense,
        suffixIconConstraints: const BoxConstraints(),
        prefixIconConstraints: BoxConstraints(maxWidth: 20.w),
        prefixIcon: prefix != null
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.5.h),
                child: Icon(prefix, size: 21.sp),
              )
            : null,
        suffixIcon: suffix != null
            ? Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: suffix,
              )
            : null,
      ),
    );
  }
}

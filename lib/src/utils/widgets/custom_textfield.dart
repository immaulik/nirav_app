import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:timepass/src/styles/app_themes.dart';
import 'package:timepass/src/utils/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {this.onChanged,
      this.preFixWidget,
      this.hint,
      this.labelText,
      this.obscure = false,
      this.validator,
      this.onSaved,
      this.color,
      this.keyBoardType,
      this.initialValue,
      this.maxLine = 1,
      this.maxLength,
      this.controller,
      this.inputFormatters,
      this.prefixText,
      this.postFixIcon,
      this.enable,
      this.isCenter,
      this.fontSize,
      this.textDirection,
      this.hintColor,
      this.styleColor,
      this.labelColor,
      this.readOnly,
      this.textInputAction,
      this.infoView,
      this.onFieldSubmitted,
      this.focusNode,
      this.focusBorderColor,
      this.filled,
      this.fillColor,
      this.borderColor,
      this.enabledColor,
      this.onTap,
      this.fontFamily,
      this.style,
      this.hintStyle,
      this.borderRadius,
      this.suffixIcon,
      this.contentPadding = const EdgeInsets.symmetric(horizontal: 10),
      this.cursorColor});

  final double? borderRadius;
  final FormFieldSetter<String>? onChanged;
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onFieldSubmitted;
  final Widget? preFixWidget;
  final String? hint;
  final String? labelText;
  final bool obscure;
  final EdgeInsets contentPadding;
  final FormFieldValidator<String>? validator;
  final Color? color;
  final Color? cursorColor;
  final TextInputType? keyBoardType;
  final String? initialValue;
  final int maxLine;
  final int? maxLength;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final String? prefixText;
  final Widget? postFixIcon;
  final Widget? suffixIcon;
  final bool? enable;
  final bool? isCenter;
  final double? fontSize;
  final TextDirection? textDirection;
  final Color? hintColor;
  final Color? styleColor;
  final Color? labelColor;
  final Color? focusBorderColor;
  final Color? borderColor;
  final Color? enabledColor;
  final Color? fillColor;
  final bool? readOnly;
  final bool? filled;
  final TextInputAction? textInputAction;
  final Widget? infoView;
  final FocusNode? focusNode;
  final void Function()? onTap;
  final String? fontFamily;
  TextStyle? style;
  TextStyle? hintStyle;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      textInputAction: textInputAction,
      textAlign:
          isCenter != null && isCenter! ? TextAlign.center : TextAlign.left,
      readOnly: readOnly ?? false,
      enabled: enable ?? true,
      onChanged: onChanged,
      maxLength: maxLength,
      controller: controller,
      maxLines: maxLine,
      initialValue: initialValue,
      keyboardType: keyBoardType,
      onTap: onTap,
      onSaved: onSaved,
      validator: validator,
      obscureText: obscure,
      inputFormatters: inputFormatters,
      textDirection: textDirection,
      style: style ??
          Get.textTheme.headline1!.copyWith(
              color: styleColor ?? Colors.black,
              fontSize: kIsWeb ? 16 : 14,
              fontWeight: FontWeight.w500,
              fontFamily: fontFamily ?? themes.fontFamily),
      cursorColor: cursorColor ?? Get.theme.primaryColor,
      decoration: InputDecoration(
          errorMaxLines: 2,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: fillColor ?? AppColors.lightGrey,
          prefixText: prefixText,
          contentPadding: contentPadding,
          hintStyle: hintStyle ??
              Get.textTheme.subtitle2!.copyWith(
                  fontSize: kIsWeb ? 16 : 14,
                  color: Colors.grey[400],
                  fontFamily: fontFamily ?? themes.fontFamily),
          errorStyle: TextStyle(fontSize: 13, color: Colors.red),
          hintText: hint,
          prefixIcon: preFixWidget,
          suffixIcon: postFixIcon,
          suffix: suffixIcon),
    );
  }
}

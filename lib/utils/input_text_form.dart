import 'package:fab_hr/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonTextField extends StatefulWidget {
  CommonTextField({
    Key? key,
    this.hintText = '',
    this.label = '',
    this.textInputType = TextInputType.name,
    this.suffixIcon,
    this.obscureText,
    this.initialText,
    this.readOnly,
    this.fillColor,
    this.maxLines,
    this.onChanged,
    this.errorMessage,
    this.formatter,
    this.maxLength,
    this.border,
    this.prefix,
    this.enabled,
    TextInputAction? textInputAction,
    this.controller,
  })  : textInputAction = textInputAction ?? TextInputAction.next,
        super(key: key);

  final String label;
  final String hintText;
  final String? initialText;
  String? errorMessage;
  final Widget? suffixIcon;
  final TextInputType textInputType;
  final TextInputAction? textInputAction;
  final bool? obscureText, readOnly, enabled;
  final Function(String?)? onChanged;
  final int? maxLines;
  final int? maxLength;
  final List<TextInputFormatter>? formatter;
  final Widget? prefix;
  final Color? fillColor;
  final border;
  final TextEditingController? controller;

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: widget.controller,
          textInputAction: widget.textInputAction,
          inputFormatters: widget.formatter,
          style: GoogleFonts.lato(fontSize: 15),
          initialValue: widget.initialText,
          keyboardType: widget.textInputType,
          enabled: widget.enabled ?? true,
          obscureText: widget.obscureText ?? false,
          maxLines: widget.maxLines ?? 1,
          readOnly: widget.readOnly ?? false,
          maxLength: widget.maxLength ?? 45,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            counterText: '',
            contentPadding: const EdgeInsets.only(top: 3, bottom: 3, left: 12),
            prefixIcon: widget.prefix,
            filled: true,
            fillColor: AppColors.whiteColor,
            border: widget.border ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    width: 0,
                    color: AppColors.bgColor,
                  ),
                ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                width: 0,
                color: AppColors.bgColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                width: 0,
                color: AppColors.bgColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                width: 0,
                color: AppColors.bgColor,
              ),
            ),
            hintText: widget.hintText,
            hintStyle: GoogleFonts.lato(
              color: AppColors.blackColor,
            ),
            suffixIcon: widget.suffixIcon != null
                ? SizedBox(
                    width: 24,
                    height: 24,
                    child: Center(child: widget.suffixIcon),
                  )
                : null,
          ),
          onChanged: (String value) {
            ///As soon as user starts typing, we will remove the error message.
            ///And error message will be shown again when validations will be triggered on button click.
            if (widget.errorMessage != null) {
              setState(() {
                widget.errorMessage = null;
              });
            }
            widget.onChanged?.call(value);
          },
        ),
        const SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            widget.errorMessage ?? "",
            style: GoogleFonts.lato(
              color: AppColors.redColor,
            ),
          ),
        ),
      ],
    );
  }
}

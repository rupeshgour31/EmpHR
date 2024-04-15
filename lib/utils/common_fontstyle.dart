import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

///Helper class for easily accessing font sizes, colors and families

class Font {
  var _textStyle = GoogleFonts.lato();

  TextStyle get s150 => _textStyle.copyWith(fontSize: 150);

  TextStyle get s40 => _textStyle.copyWith(fontSize: 40);

  TextStyle get s36 => _textStyle.copyWith(fontSize: 36);

  TextStyle get s35 => _textStyle.copyWith(fontSize: 35);

  TextStyle get s32 => _textStyle.copyWith(fontSize: 32);

  TextStyle get s24 => _textStyle.copyWith(fontSize: 24);

  TextStyle get s23 => _textStyle.copyWith(fontSize: 23);

  TextStyle get s22 => _textStyle.copyWith(fontSize: 22);

  TextStyle get s20 => _textStyle.copyWith(fontSize: 20);

  TextStyle get s18 => _textStyle.copyWith(fontSize: 18);

  TextStyle get s16 => _textStyle.copyWith(fontSize: 16);

  TextStyle get s15 => _textStyle.copyWith(fontSize: 15);

  TextStyle get s14 => _textStyle.copyWith(fontSize: 14);

  TextStyle get s13 => _textStyle.copyWith(fontSize: 13);

  TextStyle get s12 => _textStyle.copyWith(fontSize: 12);

  TextStyle get s10 => _textStyle.copyWith(fontSize: 10);

  TextStyle get s9 => _textStyle.copyWith(fontSize: 9);
}

class FontStyleGoogle extends Font {
  FontStyleGoogle.medium([final Color? color]) {
    _textStyle = _textStyle.copyWith(
      fontWeight: FontWeight.w500,
      color: color ?? Colors.black,
    );
  }

  FontStyleGoogle.regular([final Color? color]) {
    _textStyle = _textStyle.copyWith(
      fontWeight: FontWeight.w400,
      color: color ?? Colors.black,
    );
  }

  FontStyleGoogle.semiBold([final Color? color]) {
    _textStyle = _textStyle.copyWith(
      fontWeight: FontWeight.w600,
      color: color ?? Colors.black,
    );
  }
  FontStyleGoogle.semiBoldUnderline([final Color? color]) {
    _textStyle = _textStyle.copyWith(
      decoration: TextDecoration.underline,
      fontWeight: FontWeight.w600,
      color: color ?? Colors.black,
    );
  }
  FontStyleGoogle.bold([final Color? color]) {
    _textStyle = _textStyle.copyWith(
      fontWeight: FontWeight.w700,
      color: color ?? Colors.black,
    );
  }

  FontStyleGoogle.boldUnderline([final Color? color]) {
    _textStyle = _textStyle.copyWith(
      decoration: TextDecoration.underline,
      fontWeight: FontWeight.w700,
      color: color ?? Colors.black,
    );
  }
}

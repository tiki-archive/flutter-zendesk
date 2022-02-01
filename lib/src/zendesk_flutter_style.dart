/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';

class ZendeskFlutterStyle {
  static const double _stdDeviceWidth = 375;

  final double _deviceWidth;
  final double _textScaleFactor;

  final Color _backgroundColor;
  late final double _modalRadius;
  late final double _modalContainerHeight;
  final Color _modalNavColor;
  late final double _modalNavIconSize;
  late final double _modalContentPadding;

  final String _fontFamily;
  late final double _fontSize;

  final Color _textColor;
  final FontWeight _textWeight;

  ZendeskFlutterStyle(
      {MediaQueryData? mediaQueryData,
      Color backgroundColor = Colors.white,
      double modalRadius = 36,
      double modalHeight = 700,
      Color modalNavColor = Colors.grey,
      double modalNavIconSize = 16,
      double modalContentPadding = 5,
      double textPaddingHorizontal = 20,
      String fontFamily = 'Arial',
      double fontSize = 18,
      Color textColor = Colors.black,
      FontWeight textWeight = FontWeight.normal
      })
      : _textScaleFactor = mediaQueryData?.textScaleFactor ?? 1.0,
        _deviceWidth = mediaQueryData?.size.width ?? 375,
        _backgroundColor = backgroundColor,
        _modalNavColor = modalNavColor,
        _fontFamily = fontFamily,
        _textColor = textColor,
        _textWeight = textWeight{
    _modalRadius = size(modalRadius);
    _modalNavIconSize = size(modalNavIconSize);
    _modalContentPadding = size(modalContentPadding);
    _modalContainerHeight = size(modalHeight) - 24 - _modalNavIconSize;
    _fontSize = text(fontSize);
  }

  get modalContainerPaddingHorizontal => null;

  get modalContainerPaddingBottom => null;

  get cardMarginTop => null;

  get cardHorizontalPadding => null;

  get cardVerticalPadding => null;

  get cardBackgroundColor => null;

  get subtitleTextSize => null;

  get subtitleFont => null;

  get subtitleSectionColor => null;

  get subtitleArticleColor => null;

  get titleColor => null;

  get titleTextSize => null;

  get titleFont => null;

  get titleFontWeight => null;

  get breadcrumbFontWeight => null;

  get breadcrumbTextSiza => null;

  get breadcrumbPaddingTop => null;

  get headerIconWidth => null;

  get headerIconHeight => null;

  get headerIconPadding => null;

  get headerIconSize => null;

  get modalTopPadding => null;

  get headerFontWeight => null;

  get headerFontSize => null;

  double size(double raw) => (raw * (_deviceWidth / _stdDeviceWidth));

  double text(double raw) =>
      (raw * (_deviceWidth / _stdDeviceWidth)) * _textScaleFactor;

  Color get backgroundColor => _backgroundColor;

  Color get modalNavColor => _modalNavColor;

  double get modalRadius => _modalRadius;

  double get modalContainerHeight => _modalContainerHeight;

  double get modalNavIconSize => _modalNavIconSize;

  String get fontFamily => _fontFamily;

  double get fontSize => _fontSize;

  Color get textColor => _textColor;

  FontWeight get textWeight => _textWeight;

  double get modalContentPadding => _modalContentPadding;

}

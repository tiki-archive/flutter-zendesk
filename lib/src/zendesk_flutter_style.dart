/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';

import 'utils/zendesk_flutter_utils_style.dart';

class ZendeskFlutterStyle extends ZendeskFlutterUtilsStyle{

  final Color _cardBackground;
  final Color _modalNavColor;
  final Color _textColor;
  final Color _accentColor;
  final String _fontFamily;
  final String _titleFont;
  final String _subtitleFont;

  ZendeskFlutterStyle(
      {MediaQueryData? mediaQueryData,
        cardBackground = Colors.white,
        modalNavColor = Colors.grey,
        textColor = Colors.black,
        accentColor = Colors.blue,
        fontFamily = 'Arial',
        titleFont =  'Arial',
        subtitleFont = 'Arial'
      })
      : _cardBackground = cardBackground,
        _modalNavColor = modalNavColor,
        _textColor = textColor,
        _accentColor = accentColor,
        _fontFamily = fontFamily,
        _titleFont = titleFont,
        _subtitleFont = subtitleFont,
        super(mediaQueryData: mediaQueryData);

  get cardBackground => _cardBackground;
  get modalNavColor => _modalNavColor;
  get textColor => _textColor;
  get accentColor => _accentColor;
  get fontFamily => _fontFamily;
  get titleFont => _titleFont;
  get subtitleFont => _subtitleFont;

}

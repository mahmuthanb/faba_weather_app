import 'package:flutter/material.dart';

class CustomSpacer {
  /// 2.0
  static const double space2 = 2.0;

  /// 4.0
  static const double space4 = 4.0;

  /// 8.0
  static const double space8 = 8.0;

  /// 12.0
  static const double space12 = 12.0;

  /// 16.0
  static const double space16 = 16.0;

  /// 20.0
  static const double space20 = 20.0;

  /// 24.0
  static const double space24 = 24.0;

  /// 32.0
  static const double space32 = 32.0;

  /// 48.0
  static const double space48 = 48.0;

  /// 96.0
  static const double space96 = 96.0;
}

extension CustomEdgeInsets on double {
  EdgeInsets get all => EdgeInsets.all(this);
  EdgeInsets get vertical => EdgeInsets.symmetric(vertical: this);
  EdgeInsets get horizontal => EdgeInsets.symmetric(horizontal: this);
  EdgeInsets get onlyTop => EdgeInsets.only(top: this);
  EdgeInsets get onlyBottom => EdgeInsets.only(bottom: this);
  EdgeInsets get onlyLeft => EdgeInsets.only(left: this);
  EdgeInsets get onlyRight => EdgeInsets.only(right: this);
}

extension CustomSizedBox on double {
  SizedBox get h => SizedBox(height: this);
  SizedBox get w => SizedBox(width: this);
}

import 'package:flutter/widgets.dart';
import 'package:watchyy/styles/styles.dart';

abstract class WASpacings {
  static const zero = WASpacing._(0);
  static const xxs = WASpacing._(2);
  static const xs = WASpacing._(4);
  static const sm = WASpacing._(8);
  static const md = WASpacing._(12);
  static const lg = WASpacing._(16);
  static const xl = WASpacing._(20);
  static const xxl = WASpacing._(32);
  static const xxxl = WASpacing._(48);
  static const xxxxl = WASpacing._(64);
  static const xxxxxl = WASpacing._(88);
}

class WASpacing {
  const WASpacing._(this.value);

  final double value;

  EdgeInsetsDirectional get all => EdgeInsetsDirectional.all(value);

  EdgeInsetsDirectional get horizontal =>
      EdgeInsetsDirectional.symmetric(horizontal: value);
  EdgeInsetsDirectional get vertical =>
      EdgeInsetsDirectional.symmetric(vertical: value);

  EdgeInsetsDirectional get start => EdgeInsetsDirectional.only(start: value);
  EdgeInsetsDirectional get top => EdgeInsetsDirectional.only(top: value);
  EdgeInsetsDirectional get end => EdgeInsetsDirectional.only(end: value);
  EdgeInsetsDirectional get bottom => EdgeInsetsDirectional.only(bottom: value);

  SizedBox get horizontalSpace => SizedBox(width: value);
  SizedBox get verticalSpace => SizedBox(height: value);
}

EdgeInsetsDirectional getContentHorizontalPadding() => WASpacings.lg.horizontal;

SizedBox getContentSpacingVertical() {
  if (isAndroid()) {
    return WASpacings.xl.verticalSpace;
  }

  return WASpacings.xxxxxl.verticalSpace;
}

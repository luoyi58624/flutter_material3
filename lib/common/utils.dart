import 'package:flutter/material.dart';

enum ColorMode {
  auto,
  light,
  dark,
}

class ColorUtil {
  ColorUtil._();

  static MaterialColor primaryColor =
      createMaterialColor(const Color.fromARGB(255, 0, 120, 212));

  static MaterialColor successColor =
      createMaterialColor(const Color.fromARGB(255, 16, 185, 129));

  static MaterialColor warningColor =
      createMaterialColor(const Color.fromARGB(255, 245, 158, 11));

  static MaterialColor errorColor =
      createMaterialColor(const Color.fromARGB(255, 239, 68, 68));

  static MaterialColor infoColor =
      createMaterialColor(const Color.fromARGB(255, 127, 137, 154));

  static Color baseColor(BuildContext context, {ColorMode? mode}) {
    return dynamicColor(
      Colors.white,
      Colors.black,
      context,
      mode: mode,
    );
  }

  /// 头部背景颜色
  static Color headerColor(BuildContext context, {ColorMode? mode}) {
    return dynamicColor(
      Colors.white,
      Theme.of(context).colorScheme.surface,
      context,
      mode: mode,
    );
  }

  /// 背景颜色
  static Color backgroundColor(BuildContext context, {ColorMode? mode}) {
    return dynamicColor(
      const Color(0xFFf1f1f1),
      const Color(0xFF222222),
      context,
      mode: mode,
    );
  }

  /// input输入框填充背景色
  static Color inputFileColor(BuildContext context, {ColorMode? mode}) {
    return dynamicColor(
      Colors.grey.shade200,
      Colors.grey.shade700,
      context,
      mode: mode,
    );
  }

  /// input输入框提示颜色
  static Color inputHintColor(BuildContext context, {ColorMode? mode}) {
    return dynamicColor(
      Colors.grey.shade500,
      Colors.grey.shade300,
      context,
      mode: mode,
    );
  }

  /// 文本颜色
  static Color textColor(BuildContext context, {ColorMode? mode}) {
    return dynamicColor(
      const Color(0xFF2c3e50),
      const Color(0xFFf1f2f6),
      context,
      mode: mode,
    );
  }

  /// 二级文本颜色
  static Color secondTextColor(BuildContext context, {ColorMode? mode}) {
    return dynamicColor(
      Colors.grey.shade700,
      const Color(0xFFf1f2f6),
      context,
      mode: mode,
    );
  }

  /// 分割线颜色
  static Color separatorColor(BuildContext context, {ColorMode? mode}) {
    return dynamicColor(
      const Color.fromARGB(73, 60, 60, 67),
      const Color.fromARGB(153, 84, 84, 88),
      context,
      mode: mode,
    );
  }

  /// 骨架屏颜色
  static Color skeletonColor(BuildContext context, {ColorMode? mode}) {
    return dynamicColor(
      Colors.grey.shade300,
      Theme.of(context).colorScheme.surface,
      context,
      mode: mode,
    );
  }

  /// 骨架屏高亮颜色
  static Color skeletonHighlightColor(BuildContext context, {ColorMode? mode}) {
    return dynamicColor(
      Colors.grey.shade100,
      Theme.of(context).colorScheme.surface.withAlpha(200),
      context,
      mode: mode,
    );
  }

  /// 是否为黑暗模式，要想保持响应式必须以函数形式使用
  static bool isDark(BuildContext context) {
    return Theme.of(context).colorScheme.brightness == Brightness.dark;
  }

  /// 返回一个动态颜色
  static Color dynamicColor(
    lightColor,
    darkColor,
    BuildContext context, {
    ColorMode? mode,
  }) {
    ColorMode colorMode = mode ?? ColorMode.auto;
    switch (colorMode) {
      case ColorMode.auto:
        return isDark(context) ? darkColor : lightColor;
      case ColorMode.light:
        return lightColor;
      case ColorMode.dark:
        return darkColor;
    }
  }

  /// 创建material颜色
  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}

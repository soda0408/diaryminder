import 'dart:ui';

class AppColor {
  static final Brand brand = Brand(); // クラス名をパブリックに変更
  static final TextColors text = TextColors(); // クラス名をパブリックに変更
  static final UiColors ui = UiColors(); // クラス名をパブリックに変更
}

class Brand {
  // クラス名をパブリックに変更
  final Color primary = const Color(0xFFFFFFFF);
  final Color secondary = const Color(0xFF062E3C);
}

class TextColors {
  // クラス名をパブリックに変更
  final Color primary = const Color(0xFFFFFFFF);
  final Color secondary = const Color(0xFF062E3C);
  final Color gray = const Color.fromARGB(255, 142, 162, 170);
}

class UiColors {
  // クラス名をパブリックに変更
  final Color logo = const Color(0xFFFFFFFF);
  final Color primary = const Color(0xFFFFFFFF);
  final Color secondary = const Color(0xFF062E3C);
  final Color gray = const Color.fromARGB(255, 142, 162, 170);
  final Color background = const Color(0xFF9CB4B4);

  final Color shadow = const Color(
    0xFF000000,
  ).withAlpha(102); // 0.4 * 255 = 102
  final Color saturday = const Color(0xFF8EAFED);
  final Color sunday = const Color(0xFFED8EAF);
  final Color unsupported = const Color(0xFFD3D3D3);
  final Color shimmerBase = const Color(0xFFE0E0E0);
  final Color shimmerHighlight = const Color(0xFFFFFFFF);
}

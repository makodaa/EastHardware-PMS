import 'package:fluent_ui/fluent_ui.dart';

class Gaps {
  // Vertical Gaps
  static const Widget v4 = SizedBox(height: 4);
  static const Widget v8 = SizedBox(height: 8);
  static const Widget v12 = SizedBox(height: 12);
  static const Widget v16 = SizedBox(height: 16);
  static const Widget v32 = SizedBox(height: 32);
  static const Widget v64 = SizedBox(height: 64);

  // Horizontal Gaps
  static const Widget h4 = SizedBox(width: 4);
  static const Widget h8 = SizedBox(width: 8);
  static const Widget h12 = SizedBox(width: 12);
  static const Widget h16 = SizedBox(width: 16);
}

class AppPadding {
  static const EdgeInsets a4 = EdgeInsets.all(4);
  static const EdgeInsets a8 = EdgeInsets.all(8);
  static const EdgeInsets a12 = EdgeInsets.all(12);
  static const EdgeInsets a16 = EdgeInsets.all(16);
  static const EdgeInsets a32 = EdgeInsets.all(32);
  static const EdgeInsets a64 = EdgeInsets.all(64);
  static const EdgeInsets v8h16 = EdgeInsets.symmetric(vertical: 8, horizontal: 16);
  static const EdgeInsets v32h64 = EdgeInsets.symmetric(vertical: 32, horizontal: 64);
}

extension GapList on List<Widget> {
  List<Widget> withGap(Widget Function() gapWidget) => [
        for (var (index, widget) in indexed) ...[
          widget,
          if (index < length - 1) gapWidget(),
        ]
      ];
}

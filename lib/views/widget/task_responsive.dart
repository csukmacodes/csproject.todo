import 'package:flutter/material.dart';
import 'package:todo/utils/constant.dart';

/// created by : candra
/// email : csukma.codes@gmail.com
/// date : Feb 17, 2024 22:28:39
/// project : todo

class TaskResponsive extends StatelessWidget {
  const TaskResponsive({
    super.key,
    required this.startContent,
    this.endContent,
    this.startFlex = 1,
    this.endFlex = 1,
    this.breakpoint = Breakpoint.tablet,
    required this.spacing,
    this.rowMainAxisAlignment = MainAxisAlignment.start,
    this.rowCrossAxisAlignment = CrossAxisAlignment.start,
    this.columnMainAxisAlignment = MainAxisAlignment.start,
    this.columnCrossAxisAlignment = CrossAxisAlignment.stretch,
  });

  final Widget startContent;
  final Widget? endContent;
  final int startFlex;
  final int endFlex;
  final double breakpoint;
  final double spacing;
  final MainAxisAlignment rowMainAxisAlignment;
  final CrossAxisAlignment rowCrossAxisAlignment;
  final MainAxisAlignment columnMainAxisAlignment;
  final CrossAxisAlignment columnCrossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= breakpoint) {
        return Row(
          mainAxisAlignment: rowMainAxisAlignment,
          crossAxisAlignment: rowCrossAxisAlignment,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(flex: startFlex, child: startContent),
            SizedBox(width: spacing),
            endContent != null ? VerticalDivider() : SizedBox(),
            endContent != null ? Expanded(flex: endFlex, child: endContent!) : Container(),
          ],
        );
      } else {
        return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: columnMainAxisAlignment,
          crossAxisAlignment: columnCrossAxisAlignment,
          children: [
            Expanded(flex: startFlex, child: startContent),
            SizedBox(height: spacing),
            endContent != null ? Divider() : SizedBox(),
            endContent != null ? Expanded(flex: endFlex, child: endContent!) : SizedBox(),
          ],
        );
      }
    });
  }
}

library flutter_badge;

import 'package:flutter/material.dart';

///
/// Created by chell on 2019/01/17.
/// A badge widget with free location and customizable style.
///
class Badge extends StatelessWidget {

  Badge({
    Key key,
    @required this.child,
    this.text,
    this.number,
    this.showExactNumber = false,
    this.textStyle = const TextStyle(color: Colors.white, fontSize: 11),
    this.align = Alignment.topRight,
    this.offsetX = 0.0,
    this.offsetY = 0.0,
    this.padding = 5.0,
    this.backgroundColor = Colors.red,
    this.borderRadius = 100.0,
    this.borderWidth = 0.0,
    this.borderColor,
    this.customBorder,
    this.showShadow = false,
    this.customShadows,
    this.visible = true,
  }) : assert(child != null),
        assert(text != null || number != null),
        super(key: key);

  ///A child widget under the badge, it can't be null.
  final Widget child;

  ///The text display in badge, conflict with [number].
  ///If you provide [text] and [number] both, only [text] can be effective.
  final String text;

  ///If you just want to show number, use this.
  final int number;

  ///Show number exactly if using [number] to display.
  final bool showExactNumber;

  ///Text style of badge.
  final TextStyle textStyle;

  ///Initial location in stack.
  final Alignment align;

  ///Adjust horizontal position based on [align.x].
  final double offsetX;

  ///Adjust vertical position based on [align.y].
  final double offsetY;

  ///The padding from text to its border.
  final double padding;

  ///Color of badge.
  final Color backgroundColor;

  ///Border radius of badge.
  final double borderRadius;

  ///Border width of badge.
  final double borderWidth;

  ///Border color of badge.
  final Color borderColor;

  ///Custom border, only take effect when [borderWidth] and [borderColor] are null.
  final Border customBorder;

  ///Show badge shadow.
  final bool showShadow;

  ///Custom shadow, it will override default badge shadow.
  final List<BoxShadow> customShadows;

  ///Hide badge if false.
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      alignment: align,
      children: <Widget>[
        child,
        visible ?
        Positioned(
            left: isLeft() ? offsetX : null,
            right: isRight() ? offsetX : null,
            top: isTop() ? offsetY : null,
            bottom: isBottom() ? offsetY : null,
            child: Container(
              padding: EdgeInsets.fromLTRB(padding, padding / 2.0, padding, padding / 2.0),
              child: Text(_badgeText, style: textStyle,),
              decoration: BoxDecoration(
                color: backgroundColor,
                shape: _badgeShape,
                borderRadius: _badgeRadius,
                border: _badgeBorder,
                boxShadow: _badgeShadows,
              ),
            )) : Container(width: 0, height: 0,)
      ],
    );
  }

  String get _badgeText {
    if (text != null) {
      return text;
    } else if (number != null) {
      if (number <= 0) {
        return '';
      } else {
        if (number > 99 && !showExactNumber) {
          return '99+';
        } else {
          return number.toString();
        }
      }
    } else {
      return '';
    }
  }

  BoxShape get _badgeShape {
    if (borderRadius == 100 && _badgeText.length <= 1) {
      return BoxShape.circle;
    } else {
      return BoxShape.rectangle;
    }
  }

  BorderRadius get _badgeRadius {
    if (_badgeShape == BoxShape.circle) {
      return null;
    } else {
      return BorderRadius.circular(borderRadius);
    }
  }

  Border get _badgeBorder {
    if (borderColor != null && borderWidth != null && borderWidth > 0) {
      return Border.all(color: borderColor, width: borderWidth);
    } else if (customBorder != null) {
      return customBorder;
    } else {
      return null;
    }
  }

  List<BoxShadow> get _badgeShadows {
    if (showShadow) {
      if (customShadows == null) {
        return List.filled(1, BoxShadow(
            color: const Color(0xffbbbbbb),
            blurRadius: 0.5,
            spreadRadius: 0.5,
            offset: Offset(1.2, 1.2)));
      } else {
        return customShadows;
      }
    } else {
      return null;
    }
  }

  bool isLeft() => align.x == -1.0;

  bool isRight() => align.x == 1.0;

  bool isTop() => align.y == -1.0;

  bool isBottom() => align.y == 1.0;
}

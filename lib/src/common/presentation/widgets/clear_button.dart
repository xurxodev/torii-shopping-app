import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClearButton extends StatelessWidget {
  const ClearButton({Key key, this.onPressed, this.color = Colors.blue})
      : super(key: key);

  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    return IconButton(
      icon: ClearButtonIcon(),
      color: color,
      onPressed: onPressed,
    );
  }
}

class ClearButtonIcon extends StatelessWidget {
  const ClearButtonIcon({Key key}) : super(key: key);

  static IconData _getIconData(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return Icons.clear;
      case TargetPlatform.iOS:
        return CupertinoIcons.clear_circled_solid;
    }
    assert(false);
    return null;
  }

  @override
  Widget build(BuildContext context) =>
      Icon(_getIconData(Theme.of(context).platform));
}

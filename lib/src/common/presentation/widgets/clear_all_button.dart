import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClearAllButton extends StatelessWidget {
  const ClearAllButton({Key key, this.onPressed, this.color})
      : super(key: key);

  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    return IconButton(
      icon: ClearAllButtonIcon(),
      color: color,
      onPressed: onPressed,
    );
  }
}

class ClearAllButtonIcon extends StatelessWidget {
  const ClearAllButtonIcon({Key key}) : super(key: key);

  static IconData _getIconData(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.iOS:
        return Icons.clear_all;
    }
    assert(false);
    return null;
  }

  @override
  Widget build(BuildContext context) =>
      Icon(_getIconData(Theme.of(context).platform));
}

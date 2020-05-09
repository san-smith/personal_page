import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  final String toolTip;

  const SocialButton({
    Key key,
    this.onTap,
    this.child,
    @required this.toolTip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: toolTip,
      child: ClipOval(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            child: SizedBox(
              width: 50,
              height: 50,
              child: Center(
                child: child,
              ),
            ),
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}

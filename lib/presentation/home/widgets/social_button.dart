import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;

  const SocialButton({
    Key key,
    this.onTap,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
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
    );
  }
}

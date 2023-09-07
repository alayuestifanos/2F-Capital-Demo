import 'package:flutter/material.dart';

class AnimatedButton extends StatelessWidget {
  const AnimatedButton({
    Key? key,
    this.onTap,
    this.showShadow = false,
    required this.child,
  }) : super(key: key);
  final void Function()? onTap;
  final bool showShadow;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Center(
        child: Container(
          height: 90,
          width: 90,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                if (showShadow)
                  BoxShadow(
                    color: Colors.black.withOpacity(.3),
                    spreadRadius: 1.5,
                    blurRadius: 10,
                  )
              ]),
          child: child,
        ),
      ),
    );
  }
}

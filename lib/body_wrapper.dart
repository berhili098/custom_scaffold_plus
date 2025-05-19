import 'package:flutter/material.dart';

class BodyWrapper extends StatelessWidget {
  final Widget child;
  final Alignment alignment;
  final bool showOverlay;
  final String? bgOverlay;
  final Color backgroundCOlor;
  final double? heightFactor;
  final Gradient? gradient;
  final EdgeInsetsGeometry? padding;
  const BodyWrapper({
    super.key,
    required this.child,
    this.backgroundCOlor = Colors.transparent,
    this.bgOverlay ,
    this.showOverlay = true,
    this.alignment = Alignment.topCenter,
    this.gradient,
    this.heightFactor,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.passthrough,
      children: [
        if (showOverlay && bgOverlay != null)
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(color: backgroundCOlor, gradient: gradient),
            child: Image.asset(
              bgOverlay!,
              fit: BoxFit.cover,
              opacity: const AlwaysStoppedAnimation(0.5),
            ),
          )
        else
          const SizedBox(),
        Container(
          padding: EdgeInsets.zero,
          alignment: alignment,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: child,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class BodyWrapper extends StatelessWidget {
  final Widget child;
  final Alignment alignment;
  final bool showOverlay;
  final String? bgOverlay;
  final Color backgroundColor;
  final double? heightFactor;
  final Gradient? gradient;
  final EdgeInsetsGeometry? padding;
  const BodyWrapper({
    super.key,
    required this.child,
    this.backgroundColor = Colors.transparent,
    this.bgOverlay,
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
            decoration:
                BoxDecoration(color: backgroundColor, gradient: gradient),
            child: Image.asset(
              bgOverlay!,
              fit: BoxFit.cover,
              opacity: const AlwaysStoppedAnimation(0.5),
            ),
          )
        else
          const SizedBox(),
        Container(
          padding: padding ?? EdgeInsets.zero,
          alignment: alignment,
          width: MediaQuery.of(context).size.width,
          height: heightFactor != null
              ? MediaQuery.of(context).size.height * heightFactor!
              : MediaQuery.of(context).size.height,
          child: child,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class AnimationWidget extends StatefulWidget {
  const AnimationWidget({
    Key? key,
    required this.child,
    required this.duration,
    required this.isAnimating,
    this.onEnd,
  }) : super(key: key);
  final Widget child;
  final Duration duration;
  final bool isAnimating;
  final VoidCallback? onEnd;

  @override
  State<AnimationWidget> createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<AnimationWidget>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? scale;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: widget.duration);
    scale = Tween<double>(begin: 1, end: 1.2).animate(controller!);
  }

  @override
  void didUpdateWidget(covariant AnimationWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isAnimating != oldWidget.isAnimating) {
      animate();
    }
  }

  animate() async {
    if (widget.isAnimating) {
      await controller!.forward();
      await controller!.reverse();
      await Future.delayed(const Duration(milliseconds: 400));

      if (widget.onEnd != null) {
        widget.onEnd!();
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(scale: scale!, child: widget.child);
  }
}
